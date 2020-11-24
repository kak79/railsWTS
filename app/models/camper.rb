# frozen_string_literal: true

class Camper < ApplicationRecord
  has_many :owners
  has_many :users, through: :owners

  has_one_attached :picture_one

  has_one_attached :picture_two

  validates :make, presence: true

  validates :camper_model, presence: true

  validates :year, presence: true, numericality: { greater_than_or_equal_to: Date.today.year - 90, less_than_or_equal_to: Date.today.year + 1 }

  validates :description, presence: true, length: { minimum: 25, maximum: 1000 }  
  
  scope :oldest_camper, lambda { order(year: :desc).last }

  scope :newest_camper, lambda { order(year: :desc).first }

end
