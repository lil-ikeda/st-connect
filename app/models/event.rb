class Event < ApplicationRecord
  has_many :event_users, foreign_key: :event_id, dependent: :destroy
  has_many :users, through: :event_users
  has_many :comments, foreign_key: :event_id, dependent: :destroy

  validates :name, :date, :image, :place, :open_time, :end_time, :owner, :description, presence: true
  validates :name, length: { in: 1..75 }

  mount_uploader :image, ImageUploader

  def self.search(input)
    if input == ""
      Event.where("date > ?", DateTime.now).all.order(date: :asc)
    else
      Event.where("events.date > ?", DateTime.now).where(['name LIKE ?', "%#{input}%"]).limit(10)
    end
  end
end
