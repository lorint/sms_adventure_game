class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.string :name
      t.string :description

      # Is it something that can be obtained, and then lost?
      t.boolean :is_persistent
      # Lasts for a duration, such as incarceration or application processing time?
      # (If nil then goes on until deactivated)
      t.integer :num_days

      # How often does this experience change health / money
      t.integer :how_often_change

      # And perhaps associated in a tree?
      t.references :parent

      t.integer :min_money
      t.integer :max_money
      t.integer :min_health
      t.integer :max_health
      t.integer :min_happiness
      t.integer :max_happiness
      t.integer :min_got_game
      t.integer :max_got_game

      t.integer :money_change
      t.integer :health_change
      t.integer :happiness_change
      t.integer :got_game_change

      # Stuff affecting another
      # t.boolean :is_affects_other
      # t.integer :other_money_change
      # t.integer :other_health_change
      # t.integer :other_fear_change
      # t.integer :other_chutzpah_change
      # t.integer :other_brexit_factor_change

      # When this is 0 then it isn't moving locations
      t.integer :location_upgrade_amount
    end
  end
end
