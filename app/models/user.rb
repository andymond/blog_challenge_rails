class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :password, :email
  validates_uniqueness_of :username, :email
  has_many :posts, dependent: :destroy
end
