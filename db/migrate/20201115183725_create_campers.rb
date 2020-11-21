# frozen_string_literal: true

class CreateCampers < ActiveRecord::Migration[6.0]
  def change
    create_table :campers do |t|
      t.string :make
      t.integer :owner_id
      t.string :camper_model
      t.integer :year
      t.string :description

      t.timestamps
    end
  end
end
