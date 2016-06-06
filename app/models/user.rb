class User < ActiveRecord::Base
  has_secure_password

  validates :password, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :links
end
