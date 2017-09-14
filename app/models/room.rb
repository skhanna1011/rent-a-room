class Room < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :bookings
  has_many :amenity_rooms
  has_many :amenities, through: :amenity_rooms

  before_validation :set_latitude_longitude

  validates :name, :address, :user, presence: true
  validates :name, :address, uniqueness: true
  validates :price, :latitude, :longitude, numericality: true

  private

  def set_latitude_longitude
    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{self.address},&key=Api_key")
    result = JSON.parse(response.body)
    if !result.has_key?("error_message")
      self.latitude = result["results"][0]["geometry"]["location"]["lat"]
      self.longitude = result["results"][0]["geometry"]["location"]["lng"]
    end
  end
end