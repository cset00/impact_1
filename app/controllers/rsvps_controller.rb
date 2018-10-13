class RsvpsController < ApplicationController
  def index
    @rsvps = Rsvp.all
  end

  def show
    @rsvp = Rsvp.find(params[:id])
  end

  def new
    @rsvp = Rsvp.new
  end

  def create
    @rsvp = Rsvp.new(create_params)
    @rsvp.active = true
    @rsvp.save 
    #replace above with correct redirect route if saved
    # if @rsvp.save
    #   redirect_to '/rsvps/get'
    # end
  end


  def cancel
    rsvp = Event.find(params[:id])
    rsvp.active = false
    rsvp.save
  end

  private
  
  def create_params
    params.require(:rsvp).permit(:reg_user_id, :event_id)
  end


end