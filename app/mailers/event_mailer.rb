class EventMailer < ActionMailer::Base
    default from: 'no-reply@impactforwomen.org.au'
    layout 'mailer'

    def new_event_email(event, reg_user)
        @event = event
        @reg_user = reg_user
        attachments.inline['impact-red-logo.svg'] = File.read(Rails.root.join("public/impact-red-logo.svg"))
        mail(to: @reg_user.email , subject: 'New upcomming event!')
    end
end

