class Campgallery < ApplicationRecord

  has_many :campers
  has_many :owners, through: :campers

  has_many_attached :pictures
  
end
