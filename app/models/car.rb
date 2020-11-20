class Car < ApplicationRecord

  has_many :owners
  has_many :users, through: :owners
  
  has_one_attached :picture

  validates :car_model, presence: true

  validates :year, presence: true, numericality: { greater_than_or_equal_to: Date.today.year - 140, less_than_or_equal_to: Date.today.year + 1 }

  validates :description, presence: true, length: { minimum: 25 , maximum: 1000 }

end