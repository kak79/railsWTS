# frozen_string_literal: true

class User < ApplicationRecord
  has_many :owners
  has_many :cars, through: :owners
  has_many :campers, through: :owners

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :user_name, presence: true

  has_one_attached :avatar

  validates :password, presence: {on: :create}, confirmation: {case_sensitive: true}, length: { in: 6..20 }

  validates :password, presence: {on: :update}, confirmation: {case_sensitive: true}, length: { in: 6..20 }

  validates :password_confirmation, presence: true
end
