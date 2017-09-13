class Room < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :bookings
  has_many :amenity_rooms
  has_many :amenities, through: :amenity_rooms
end
