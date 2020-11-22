# frozen_string_literal: true

class Car < ApplicationRecord
  has_many :owners
  has_many :users, through: :owners

  has_one_attached :picture_one

  has_one_attached :picture_two

  validates :make, presence: true

  validates :car_model, presence: true

  validates :year, presence: true, numericality: { greater_than_or_equal_to: Date.today.year - 140, less_than_or_equal_to: Date.today.year + 1 }

  validates :description, presence: true, length: { minimum: 25, maximum: 1000 }

  scope :year, -> { where(:year => true) }

  def self.oldest_car
    order('year_at desc').first
  end

  def self.newest_car
    order('year_at asc').first
  end

  def self.car_models
    all.map(&:car_model)
  end
end
