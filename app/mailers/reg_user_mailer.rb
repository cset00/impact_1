class RegUserMailer < ActionMailer::Base
    default from: 'no-reply@impactforwomen.org.au'
    layout 'mailer'

    def welcome_email
        @reg_user = params[:reg_user]
        mail(to: @reg_user.email, subject: 'Thank you for volunteering for Impact!')
    end
end
  