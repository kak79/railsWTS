class Cargallery < ApplicationRecord

  has_many :cars 
  has_many :owners, through: :cars

  has_many_attached :pictures
  
end
