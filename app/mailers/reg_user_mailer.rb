class RegUserMailer < ActionMailer::Base
    default from: 'no-reply@impactforwomen.org.au'
    layout 'mailer'

    def welcome_email(user)
        @reg_user = user
        mail(to: @reg_user.email, subject: 'Thank you for volunteering for Impact!')
    end
end
  