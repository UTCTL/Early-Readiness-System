class AddStudentsToGender < ActiveRecord::Migration
  def change
  	add_column :genders, :student_id, :integer
  	add_index :genders, :student_id
  end
end
