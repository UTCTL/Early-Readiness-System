class AddSubtopicToExam < ActiveRecord::Migration
  def change
  	add_column :exams, :subtopic_id, :integer
  	add_index "exams", ["subtopic_id"], :name => "index_exams_on_subtopic_id"  
  end
end
