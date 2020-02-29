class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :room_users, foreign_key: :room_id, dependent: :destroy
  has_many :users, through: :room_users
end
