class Topic < ApplicationRecord
  validates :micropost_id, presence: true
  validates :description, presence: true
  validates :image, presence: true

  belongs_to :micropost

  mount_uploader :image, ImageUploader
end
