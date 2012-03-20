class AddColumnToExams < ActiveRecord::Migration
  def change
	add_column :exams, :required_score, :integer  	
  end
end
