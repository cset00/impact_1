class RsvpsController < ApplicationController
    before_action :authenticate!, only: [:mark_attended ]
  def index
    @rsvps = Rsvp.all
  end

  def show
    @rsvp = Rsvp.find(params[:id])
  end

  def new
    @rsvp = Rsvp.new
    @event = Event.find(params[:event_id])
    @reg_user = RegUser.find(params[:reg_user_id])
    
  end

  def create
    
    @rsvp = Rsvp.new(create_params)
    @event = @rsvp.event
    @reg_user = @rsvp.reg_user
    @rsvp.active = true
    if @rsvp.save 
        RsvpMailer.rsvp_email(@rsvp).deliver_later
        @message = "Thank you!! You're now registered to go to #{@event.subject}"
        render :template => 'homepage/index'
    else
        @message = @rsvp.errors.full_messages
        render :new
    end

    #replace above with correct redirect route if saved
    # if @rsvp.save
    #   redirect_to '/rsvps/get'
    # end
  end


  def cancel
    @rsvp = Rsvp.find(params[:id])
  end

  def destroy
    rsvp = Rsvp.find(params[:id])
    rsvp.active = false
    if rsvp.save
        RsvpMailer.cancel_confirm_email(rsvp).deliver_later
        @message = "You're no longer attending #{rsvp.event.subject}, thanks for keeping us updated."
    end
    render :template => 'homepage/index'
  end

  def mark_attended
    rsvp = Rsvp.find(params[:id])
    rsvp.attended = true
    rsvp.save
    redirect_to event_path(rsvp.event.id)
  end

  private
  
  def create_params
    params.require(:rsvp).permit(:reg_user_id, :event_id)
  end


end