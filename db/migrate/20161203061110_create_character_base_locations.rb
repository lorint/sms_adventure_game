class CreateCharacterBaseLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :character_base_locations do |t|
      t.references :character, foreign_key: true
      t.references :location, foreign_key: true
    end
  end
end
