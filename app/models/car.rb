# frozen_string_literal: true

class Car < ApplicationRecord
  has_many :owners
  has_many :users, through: :owners

  has_many_attached :pictures

  validates :make, presence: true

  validates :car_model, presence: true

  validates :year, presence: true, numericality: { greater_than_or_equal_to: Date.today.year - 140, less_than_or_equal_to: Date.today.year + 1 , message: "date must be between 1880 and 2021" } 

  validates :description, presence: true, length: { minimum: 25, maximum: 1000 }

  scope :oldest_car, lambda { order(year: :desc).last }

  scope :newest_car, lambda { order(year: :desc).first }

end
