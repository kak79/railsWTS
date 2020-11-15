class Camper < ApplicationRecord

  has_many :owners
  has_many :users, through: :owners

  has_one_attached :picture

  validates :camper_model, presence: true

  validates :owner, presence: true

  validates :year, presence: true, numericality: { greater_than_or_equal_to: Date.today.year - 90, less_than_or_equal_to: Date.today.year }, allow_nil: true

  validates :description, presence: true, length: { minimum: 25 , maximum: 1000 }

end
