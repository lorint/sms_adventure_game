class CreateExperienceRemovals < ActiveRecord::Migration[5.0]
  def change
    create_table :experience_removals do |t|
      t.references :experience, foreign_key: true
      t.references :removed_experience
      t.integer :likelihood

      t.timestamps
    end
  end
end
