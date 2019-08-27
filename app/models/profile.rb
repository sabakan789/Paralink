class Profile < ApplicationRecord
  validates :user_id, presence: true
  validates :profile, presence: true
  validates :userimage, presence: true

  belongs_to :user

  mount_uploader :userimage, ImageUploader
end
