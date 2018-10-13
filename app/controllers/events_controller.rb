class EventsController < ApplicationController

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
        EventMailer.new_event_email(@event, RegUser.first).deliver_later
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


  private
  
  def create_params
    params.require(:event).permit(:date_time, :address, :subject, :description)
  end
end