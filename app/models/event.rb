class Event < ApplicationRecord
  has_many :event_users, foreign_key: :event_id, dependent: :destroy
  has_many :users, through: :event_users
  
  mount_uploader :image, ImageUploader
end
