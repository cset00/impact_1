class Event < ApplicationRecord

    belongs_to :admin_user, optional: true
end
