# frozen_string_literal: true

class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :owner_name
      t.integer :user_id
      t.integer :camper_id
      t.integer :car_id

      t.timestamps
    end
  end
end
