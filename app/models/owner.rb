# frozen_string_literal: true

class Owner < ApplicationRecord
  belongs_to :user
  has_many :cars, dependent: :destroy
  accepts_nested_attributes_for :cars
  has_many :campers, dependent: :destroy
  accepts_nested_attributes_for :campers  

  validates :owner_name, presence: true
end
