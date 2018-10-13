class RsvpMailer < ActionMailer::Base
    default from: 'no-reply@impactforwomen.org.au'
    layout 'mailer'

    def rsvp_email
        @rsvp = params[:rsvp]
        mail(to: @reg_user.email, subject: "You're attending '#{@rsvp.event.subject}!")
    end

    def cancel_email
        @reg_user = params[:reg_user]
        mail(to: @reg_user.email, subject: "You are no longer marked as attending #{@rsvp.event.subject}!")
    end
end
  