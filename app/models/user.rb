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
  has_many :favorites
  has_many :favorite_micropsts, through: :favorites, source: 'micropst'
end
