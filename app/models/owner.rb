# frozen_string_literal: true

class Owner < ApplicationRecord
  belongs_to :user
  has_many :cars, dependent: :destroy
  has_many :campers, dependent: :destroy

  validates :owner_name, presence: true
end
