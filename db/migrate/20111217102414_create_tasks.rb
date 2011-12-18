class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :completed
      t.integer :list_id
      
      t.timestamps
      
    end
    add_index :tasks, [:list_id, :created_at, :completed]
    
  end
end
