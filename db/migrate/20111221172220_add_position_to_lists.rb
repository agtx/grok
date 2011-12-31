class AddPositionToLists < ActiveRecord::Migration
  def change
    add_column :lists, :position, :integer
    remove_index :lists, :name
    List.reset_column_information
    
    list = List.find(:all)
    list.each_with_index do |l, i|
      l.position = i+1
      l.save!
    end
    end
end
