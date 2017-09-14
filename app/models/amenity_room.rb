class AmenityRoom < ApplicationRecord
  belongs_to :room
  belongs_to :amenity

  validates :room, :amenity, presence: true
end
