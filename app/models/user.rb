class User < ApplicationRecord
  
  has_secure_password
  
  validates_confirmation_of :password
  
  validates_confirmation_of :password_confirmation, :message => "should match confirmation"
  
  has_one_attached :avatar

  validates :permission, inclusion: { in: ["member", "admin"] }

  validates :admin, inclusion: { in: [true, false] }


end
