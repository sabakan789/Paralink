class Micropost < ApplicationRecord
  belongs_to :user
  has_many :topics, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: 'user', dependent: :destroy

  validates :user_id, presence: true
  validates :content, presence: true, length:{maximum: 200}
end
