class RegUserMailer < ApplicationMailer
    default from: "no-reply@#{ENV['HOST_URL']}"
    layout 'mailer'

    def welcome_email(user)
        @reg_user = user
        attachments.inline['impact-red-logo.svg'] = logo_att
        attachments.inline['help.svg'] = help_att
        mail(to: @reg_user.email, subject: 'Thank you for volunteering for Impact!')
    end
end
  