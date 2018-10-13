class Rsvp < ApplicationRecord
  has_many :events 
  has_many :reg_users
  
end