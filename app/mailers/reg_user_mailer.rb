class RegUserMailer < ActionMailer::Base
    default from: 'no-reply@impactforwomen.org.au'
    layout 'mailer'

    def welcome_email(user)
        @reg_user = user
        attachments.inline['impact-red-logo.svg'] = File.read(Rails.root.join("public/impact-red-logo.svg"))
        mail(to: @reg_user.email, subject: 'Thank you for volunteering for Impact!')
    end
end
  