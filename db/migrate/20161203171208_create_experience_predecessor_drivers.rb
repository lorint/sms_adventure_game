class CreateExperiencePredecessorDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :experience_predecessor_drivers do |t|
      t.references :experience_predecessor, foreign_key: true, index: {name: "index_experience_predecessor_id"}
      t.references :driving_experience
    end
  end
end
