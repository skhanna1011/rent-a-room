class User < ApplicationRecord
  belongs_to :role
  has_many :rooms
  has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :username, presence: true
  validates :mobile_no, numericality: true, length: {is: 10}, uniqueness: true 
  validates :username, uniqueness: true
end
