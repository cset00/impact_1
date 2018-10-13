class Rsvp < ApplicationRecord
  has_many :events, :reg_users
  
end