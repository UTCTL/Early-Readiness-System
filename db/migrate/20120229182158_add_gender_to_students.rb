class AddGenderToStudents < ActiveRecord::Migration
  def change
  	remove_column :students, :gender
  	add_column :students, :gender_id, :integer
  	add_index :students, :gender_id
  end
end
