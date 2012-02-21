class CreateExamSubjects < ActiveRecord::Migration
  def change
    create_table :exam_subjects do |t|
      t.string :name

      t.timestamps
    end
  end
end
