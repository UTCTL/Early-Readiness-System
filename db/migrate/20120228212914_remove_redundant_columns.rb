class RemoveRedundantColumns < ActiveRecord::Migration
  def change
  	#remove_index :scores, :exam_id_id
  	#remove_index :scores, :student_id_id
  	#remove_index :exams, :subject_id_id
  	remove_column :scores, :exam_id_id
  	remove_column :scores, :student_id_id
  	remove_column :exams, :subject_id_id

  end
end
