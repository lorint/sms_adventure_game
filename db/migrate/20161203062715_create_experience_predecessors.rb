class CreateExperiencePredecessors < ActiveRecord::Migration[5.0]
  def change
    create_table :experience_predecessors do |t|
      t.references :experience, foreign_key: true
      t.integer :likelihood
    end
  end
end
