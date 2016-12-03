class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.references :currency, foreign_key: true
      t.integer :brexit_factor
    end
  end
end
