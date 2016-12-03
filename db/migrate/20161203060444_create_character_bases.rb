class CreateCharacterBases < ActiveRecord::Migration[5.0]
  def change
    create_table :character_bases do |t|
      t.string :nickname
      t.string :description
      t.string :gender
      t.integer :starting_money
      t.integer :starting_fear
      t.integer :starting_health
      t.integer :starting_age
      t.integer :starting_chutzpah
      t.integer :brexit_factor_change
    end
  end
end
