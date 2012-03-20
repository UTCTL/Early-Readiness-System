class RemoveGenderIdFromStudents < ActiveRecord::Migration
  def change
  	remove_column :students, :gender_id
  end
end
