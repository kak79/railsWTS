class User < ApplicationRecord

  has_many :owners
  has_many :cars, through: :owners
  has_many :campers, through: :owners
  
  has_secure_password

  validates :email, presence: true, uniqueness: true

  validates :user_name, presence: true
  
  validates :password, presence: true, length: { minimum: 6 }

  has_one_attached :avatar

end
