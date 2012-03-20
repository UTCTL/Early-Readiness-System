class AddShortNameToExams < ActiveRecord::Migration
  def change
  	add_column :exams, :shortname, :string
  end
end
