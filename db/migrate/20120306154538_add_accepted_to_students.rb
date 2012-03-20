class AddAcceptedToStudents < ActiveRecord::Migration
  def change
  	add_column :students, :accepted, :boolean
  end
end
