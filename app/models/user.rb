class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # フォロー機能
  has_many :relationships,  class_name: 'Relationship', foreign_key: 'user_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy
  has_many :followings, through: :relationships
  has_many :follwers, through: :passive_relationships, source: :user
  # 通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  # メッセージ機能
  has_many :messages, dependent: :destroy
  has_many :room_users, foreign_key: :user_id, dependent: :destroy
  has_many :rooms, through: :room_users
  # コメント機能
  has_many :comments, foreign_key: :user_id, dependent: :destroy
  # イベント機能
  has_many :event_users, foreign_key: :user_id, dependent: :destroy
  has_many :events, through: :event_users
  
  # バリデーション
  validates :name, :profile, presence: true

  def self.guest
    find_or_create_by!({email: 'guest@example.com'}) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      user.profile = "ゲストユーザーです。\nこのユーザーのプロフィールの編集及び削除機能は利用不可としております。\n予めご了承くださいませ。"
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
  
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ?",current_user.id, id])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
      )
      notification.save if notification.valid?
    end
  end
  
  mount_uploader :image, ImageUploader
    
end