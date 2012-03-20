class RemoveStudentIDsFromGenders < ActiveRecord::Migration
  def change
  	remove_column :genders, :student_id
  end
end
