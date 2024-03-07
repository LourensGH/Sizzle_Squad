class Sizzler < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :booked_users, through: :bookings, source: :user
  validates :title, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many_attached :photos
end
