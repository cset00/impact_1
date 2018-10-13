class Rsvp < ApplicationRecord
  belongs_to :event
  belongs_to :reg_user
  
end