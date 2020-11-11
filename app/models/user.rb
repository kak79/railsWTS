class User < ApplicationRecord
  
  has_secure_password

  validates :user_name, presence: true, uniqueness: true
  
  validates_confirmation_of :password
  
  validates_confirmation_of :password_confirmation, :message => "should match confirmation"
  
  has_one_attached :avatar

  validates :admin, inclusion: { in: [true, false] }


end
