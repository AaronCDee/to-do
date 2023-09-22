class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.integer :overlord_id
      t.integer :overseen_todo_id

      t.timestamps
    end
    add_index :relationships, :overlord_id
    add_index :relationships, :overseen_todo_id
    add_index :relationships, [:overlord_id, :overseen_todo_id], unique: true
  end
end
