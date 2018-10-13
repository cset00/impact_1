class ApplicationMailer < ActionMailer::Base

    def logo_att
        File.read(Rails.root.join("public/impact-red-logo.svg"))
    end

    def help_att
        File.read(Rails.root.join("public/help.svg"))
    end
end
