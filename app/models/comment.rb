class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost

  validates :comment, presence: true, length:{maximum: 120}
  validates :user_id, presence: true
  validates :micropost_id, presence: true
end
