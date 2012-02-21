class CreateStudentScores < ActiveRecord::Migration
  def change
    create_table :student_scores do |t|
      t.integer :student_id
      t.integer :exam_id
      t.integer :student_score

      t.timestamps
    end
  end
end
