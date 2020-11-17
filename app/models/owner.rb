class Owner < ApplicationRecord

  belongs_to :user
  belongs_to :car
  belongs_to :camper

  validates :owner_name, presence: true

end
