class EventsController < ApplicationController

  def index
    @events = Events.all
  end

  def show
    @event = Events.find(params[:id])
  end

  def new
    #if logged_in?
    @event = Event.new
  end

  def create
    # redirect if logged_in?
    @event = Event.new(create_params)
    @event.save
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(create_params)
    @event.save
    #add redirect
  end

  def destroy
    #redirect_to'/' unless logged_in?
    event = Event.find(params[:id])
    event.active = false
    event.save
    #add redirect
  end

  private
  
  def create_params
    params.require(:event).permit(:date_timeaddress, :subject, :description)
  end
end