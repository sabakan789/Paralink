class User < ApplicationRecord
  validates :name,
              presence: true,
              uniqueness: true,
              length: { maximum: 15 }

  validates :email,
              presence: true,
              uniqueness: true,
              format: { with: /([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+\.([a-zA-Z0-9\._-]+)/ },
              if: :published?

  PW_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i.freeze
  validates :password,
              presence: true,
              format: { with: PW_REGEX },
              if: :published?

  has_secure_password validations: false

  has_one :profile, dependent: :destroy

  has_many :microposts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites
  has_many :favorite_micropsts, through: :favorites, source: 'micropst'
  has_many :active_relationships,
            class_name: 'Relationship',
            foreign_key: :following_id,
            dependent: :destroy
  has_many :followings,
            through: :active_relationships,
            source: :follower
  has_many :passive_relationships,
            class_name: 'Relationship',
            foreign_key: :follower_id,
            dependent: :destroy
  has_many :followers,
            through: :passive_relationships,
            source: :following

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:name]

    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.name = name
    end
  end

  def published?
    uid == "0"
  end
end
