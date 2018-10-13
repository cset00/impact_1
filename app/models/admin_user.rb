class AdminUser < ApplicationRecord
  has_many :events

    has_many :events
    def full_name
        "#{first_name} #{last_name}"
    end
end
