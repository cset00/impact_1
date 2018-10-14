class RsvpMailer < ApplicationMailer
    default from: "no-reply@#{ENV['HOST_URL']}"
    layout 'mailer'

    def rsvp_email(rsvp)
        @rsvp = rsvp
        attachments.inline['impact-red-logo.svg'] = logo_att
        attachments.inline['help.svg'] = help_att
        mail(to: @rsvp.reg_user.email, subject: "You're attending '#{@rsvp.event.subject}!")
    end

    def cancel_confirm_email(rsvp)
        @rsvp = rsvp
        attachments.inline['impact-red-logo.svg'] = logo_att
        attachments.inline['help.svg'] = help_att
        mail(to: @rsvp.reg_user.email, subject: "You are no longer marked as attending #{@rsvp.event.subject}!")
    end
end
  