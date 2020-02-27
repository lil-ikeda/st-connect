class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :evnet_users, dependent: :destroy
  has_many :events, through: :event_users

  has_many :relationships
  has_many :followings, through: :relationships, source: :following
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'following_id'
  has_many :follwers, through: :passive_relationships, source: :user

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(following_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(following_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  mount_uploader :image, ImageUploader
end
