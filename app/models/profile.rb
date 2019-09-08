class Profile < ApplicationRecord
  validates :profile, presence: true, length:{maximum: 250}
  validates :userimage, presence: true
  validates :user_id, presence: true

  belongs_to :user

  mount_uploader :userimage, ImageUploader
end
