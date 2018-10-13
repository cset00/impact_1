class EventsController < ApplicationController
  before_action :authenticate!, except: [:show, :index ]

  def index
    @events = Event.where(active: true)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    #if logged_in?
    @event = Event.new
  end

  def create
    # redirect if logged_in?
    @event = Event.new(create_params)
    @event.active = true
    @event.cancelled = false
    if @event.save
        RegUser.subscribed.each do |user|
            EventMailer.new_event_email(@event, user).deliver_later
        end
        redirect_to events_path
    else
        render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(create_params)
    if @event.save
        redirect_to event_path(@event.id)
    else
        render :edit
    end
    #add redirect
  end

  def destroy
    #redirect_to'/' unless logged_in?
    event = Event.find(params[:id])
    event.active = false
    event.save
    redirect_to events_path
    #add redirect
  end

  def cancel
    event = Event.find(params[:id])
    event.cancelled = true
    event.save
  end

  def adhoc_registration
    @reg_user = RegUser.new
    @event = Event.find(params[:id])
  end

  def adhoc_register
    @event = Event.find(params[:id])
    @reg_user = RegUser.new(reg_user_create_params)
    @reg_user.active_sub = true
    if @reg_user.save
        Rsvp.create(
            reg_user: @reg_user,
            event: @event,
            active: true,
            attended: true
        )
        redirect_to event_path(@event.id)
    else
        render :adhoc_registration
    end
  end

  private
  
  def create_params
    params.require(:event).permit(:date_time, :address, :subject, :description)
  end

  def reg_user_create_params
    params.require(:reg_user).permit(:first_name, :last_name, :email, :school, :suburb, :contact_num)
  end
end