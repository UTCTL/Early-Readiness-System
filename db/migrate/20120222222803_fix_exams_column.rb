class FixExamsColumn < ActiveRecord::Migration
  def change
  	rename_column :exams, :subject_id_id, :subject_id
	rename_column :scores, :exam_id_id, :exam_id
  	rename_column :scores, :student_id_id, :subject_id
  end
end
