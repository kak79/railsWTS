class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :user_name, :password
  validates_confirmation_of :password, :message => "should match confirmation"



end
