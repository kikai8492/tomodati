class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }
end