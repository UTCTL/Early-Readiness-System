class AddEidToStudents < ActiveRecord::Migration
  def change
  	add_column :students, :eid, :string
  end
end
