class CreateCharacterBaseExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :character_base_experiences do |t|
      t.references :character_base, foreign_key: true
      t.references :experience, foreign_key: true
      t.references :location, foreign_key: true
      t.integer :likelihood
    end
  end
end
