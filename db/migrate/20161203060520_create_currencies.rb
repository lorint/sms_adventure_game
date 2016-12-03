class CreateCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :currencies do |t|
      t.string :name
      t.float :exchange_rate
      t.integer :ease_of_use
    end
  end
end
