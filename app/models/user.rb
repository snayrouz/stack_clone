class User < ApplicationRecord
  has_secure_password
  has_many :questions
  
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :password, uniqueness: true, presence: true
end
