class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :is_admin
      t.boolean :is_moderator
      t.boolean :is_creator
    end
  end
end
