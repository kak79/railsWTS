class Cargallery < ApplicationRecord

  has_one :car 
  has_one :owner, through: :car

  has_many_attached :car_image

 
  
end
