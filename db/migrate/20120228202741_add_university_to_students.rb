class AddUniversityToStudents < ActiveRecord::Migration
  def change
  		add_column :students, :university_id, :integer
  		add_column :sections, :university_id, :integer
  		add_index :students, :university_id
  		add_index :sections, :university_id	
  end
end
