# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :current_password

  has_many :owners
  has_many :cars, through: :owners
  has_many :campers, through: :owners

  has_secure_password

  validates :email, presence: true, uniqueness: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :user_name, presence: true

  validates_presence_of :password

  has_one_attached :avatar

  
  # validates_presence_of :current_password, if: :validate_password?, on: :update
  # validate :current_password_is_correct, if: :validate_password?, on: :update  

  # def self.authenticate(user, password)  
  #   user = find_by_code(user)
  #   if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)  
  #       user  
  #   end  
  # end  

  # def current_password_is_correct
  #   unless User.authenticate(code, current_password)
  #     errors.add(:current_password, "Wrong password.")
  #   end
  # end

  # def validate_password?
  
  # end

end
