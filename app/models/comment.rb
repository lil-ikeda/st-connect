class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :text, presence: true
end
