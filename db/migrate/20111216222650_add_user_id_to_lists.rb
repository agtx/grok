class AddUserIdToLists < ActiveRecord::Migration
  def change

    add_column :lists, :user_id, :integer
    add_index :lists, [:user_id, :created_at]  
  end
end
