class RegUser < ApplicationRecord
    # add in a has many for rsvps
    scope :subscribed, -> { where(active_sub: true) }
end
