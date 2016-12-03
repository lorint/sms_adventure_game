class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.references :user, foreign_key: true
      t.references :character_base, foreign_key: true
      t.string :name
      t.integer :money
      t.integer :fear
      t.integer :health
      t.integer :age
      t.integer :chutzpah
      t.integer :brexit_factor
      t.boolean :is_alive, default: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
