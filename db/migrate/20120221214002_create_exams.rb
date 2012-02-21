class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :title
      t.integer :subject_id
      t.integer :required_score

      t.timestamps
    end
  end
end
