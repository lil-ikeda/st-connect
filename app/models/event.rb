class Event < ApplicationRecord
  has_many :event_users, foreign_key: :event_id, dependent: :destroy
  has_many :users, through: :event_users
  has_many :comments, dependent: :destroy
  
  mount_uploader :image, ImageUploader

  def self.search(input)
    if input == ""
      Event.all.order(date: :asc)
    else
      Event.where(['name LIKE ?', "%#{input}%"] ).limit(10)
    end
  end

end
