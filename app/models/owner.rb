class Owner < ApplicationRecord

  belongs_to :user
  belongs_to :car
  belongs_to :camper

end
