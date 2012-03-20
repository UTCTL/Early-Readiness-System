class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :student_score
      t.references :student
      t.references :exam

      t.timestamps
    end
    add_index :scores, :student_id
    add_index :scores, :exam_id
  end
end
