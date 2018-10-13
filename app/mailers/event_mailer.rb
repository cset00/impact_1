class EventMailer < ActionMailer::Base
    default from: 'no-reply@impactforwomen.org.au'
    layout 'mailer'

    def new_event_email
        @event = params[:event]
        mail(to: params[:email], subject: 'New upcomming event!')
    end
end

