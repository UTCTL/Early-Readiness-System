class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.references :subject

      t.timestamps
    end
    add_index :exams, :subject_id
  end
end
