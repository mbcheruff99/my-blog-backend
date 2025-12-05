class User < ApplicationRecord

  
  has_secure_password
  validates :email, presence: true, uniqueness: true 
  validates :password, presence: true
  # validates :password_confirmation, presence: true, length: { minimum: 6 }

  has_many :posts

end
