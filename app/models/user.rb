class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :owned_sizzlers, foreign_key: 'user_id', class_name: 'Sizzler'
  has_many :booked_sizzlers, through: :bookings, class_name: 'Sizzler'
  has_one_attached :photo
end
