class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'

  validates :user_id, presence: true
  validates :content, presence: true, length:{maximum: 200}

  mount_uploader :image, ImageUploader
end
