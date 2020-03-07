class Relationship < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :following, class_name: 'User'

  validates :user_id, presence: true
  validates :following_id, presence: true
end
