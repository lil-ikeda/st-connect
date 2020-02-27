class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :evnet_users, dependent: :destroy
  has_many :events, through: :event_users
  has_many :active_relationships, class_name: "Relationship", foreign_key: "user_id", dependent: :destroy
  has_many :following, through: :active_relationships
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  
  mount_uploader :image, ImageUploader
end
