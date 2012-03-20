class RemoveColumnsFromStudentsandSections < ActiveRecord::Migration
  def change
  	remove_index :students, :university_id
  	remove_index :sections, :university_id
  	remove_column :sections, :university_id
  	remove_column :students, :university_id
  end
end
