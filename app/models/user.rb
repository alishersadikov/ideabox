class User < ApplicationRecord
  validates :username, :email, :password, presence: true
  validates :email, uniqueness: true
  validates_confirmation_of :password
  has_secure_password
  has_many :ideas
  enum role: [:default, :admin]
end
