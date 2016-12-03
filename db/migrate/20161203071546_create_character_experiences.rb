class CreateCharacterExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :character_experiences do |t|
      t.references :experience, foreign_key: true
      t.references :character, foreign_key: true
      # In case someone smacked you with this one
      t.references :instigator

      t.boolean :is_active, default: true
      t.integer :when

      t.timestamps
    end
  end
end
