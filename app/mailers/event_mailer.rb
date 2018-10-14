class EventMailer < ApplicationMailer
    default from: "no-reply@#{ENV['HOST_URL']}"
    layout 'mailer'

    def new_event_email(event, reg_user)
        @event = event
        @reg_user = reg_user
        attachments.inline['impact-red-logo.svg'] = logo_att
        attachments.inline['help.svg'] = help_att
        mail(to: @reg_user.email , subject: 'New upcomming event!')
    end
end

