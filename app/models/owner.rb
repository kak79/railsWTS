# frozen_string_literal: true

class Owner < ApplicationRecord
  belongs_to :user
  has_many :cars
  has_many :campers

  validates :owner_name, presence: true
end
