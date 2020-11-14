class Car < ApplicationRecord


  has_one_attached :picture

  validates :car_model, presence: true

  validates :owner, presence: true

  validates :year, presence: true, numericality: { is: 4 }

  validates :description, presence: true, length: { minimum: 25 , maximum: 1000 }



end