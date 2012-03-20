class AddGenderToStudentsAgain < ActiveRecord::Migration
  def change
  	add_column :students, :gender_id, :integer
  	add_index :students, :gender_id
  end
end
