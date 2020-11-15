class User < ApplicationRecord

  has_many :owners
  has_many :cars, through: :owners
  
  has_secure_password

  validates :name, presence: true

  validates :user_name, presence: true, uniqueness: true
  
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_one_attached :avatar

end
