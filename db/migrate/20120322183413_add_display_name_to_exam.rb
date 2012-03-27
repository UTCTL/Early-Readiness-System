class AddDisplayNameToExam < ActiveRecord::Migration
  def change
  	add_column :exams, :displayname, :string
  end
end
