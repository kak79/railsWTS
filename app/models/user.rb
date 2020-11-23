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

  has_one_attached :avatar

  validates :password, presence: {on: :create}, confirmation: {case_sensitive: true}, length: {minimum: 8}

  validates :password, presence: {on: :update}, confirmation: {case_sensitive: true}, length: {minimum: 8}

  validates :password_confirmation, presence: true
  
  validates_presence_of :current_password
  validate :current_password_is_correct, on: :update

  def current_password_is_correct
    if !password.blank?
      user = User.find_by_id(id)
      if (user.authenticate(current_password) == false)
        errors.add(:current_password, "is incorrect.")
      end
    end
  end
  
  

end
