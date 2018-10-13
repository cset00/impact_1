class Event < ApplicationRecord

    belongs_to :admin_user, optional: true

    def dt
        date_time.strftime("%d/%m/%Y %l:%M %P")
    end
end
