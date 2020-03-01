class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :evnet_users, foreign_key: :user_id, dependent: :destroy
  has_many :events, through: :event_users

  has_many :relationships
  has_many :followings, through: :relationships, source: :following
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'following_id'
  has_many :follwers, through: :passive_relationships, source: :user

  has_many :messages
  has_many :room_users, foreign_key: :user_id, dependent: :destroy
  has_many :rooms, through: :room_users

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  
  def follow(other_user)
    unless self == other_user 
      if other_user.followings.include?(self)# フォローした相手から既にフォローされていればroomをcreate
        room = Room.create
        RoomUser.create(user_id: self.id, room_id: room.id)
        RoomUser.create(user_id: other_user.id, room_id: room.id)
      end
      self.relationships.find_or_create_by(following_id: other_user.id)
    end
  end

  def unfollow(other_user)
    the_room = (self.rooms & other_user.rooms)[0]# 自分と相手が両方入ってるroomを取り出す
    if the_room
      the_room.destroy
    end
    relationship = self.relationships.find_by(following_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def matchers
    User.where(id: passive_relationships.select(:user_id))
    .where(id: relationships.select(:following_id))
  end

  mount_uploader :image, ImageUploader
end
