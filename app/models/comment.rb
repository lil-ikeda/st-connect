class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :text, presence: true, length: { in: 1..255 }
end
