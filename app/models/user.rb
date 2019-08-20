class User < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: true,
                   length: { maximum: 15 }

  validates :email, presence: true,
                    uniqueness: true,
                    format: {with: /[A-Za-z0-9._+]+@[A-Za-z]+.[A-Za-z]/}

  PW_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i
  validates :password, presence: true, format: { with: PW_REGEX }

  has_secure_password

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
end
