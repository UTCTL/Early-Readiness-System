class CreateQuestionResponses < ActiveRecord::Migration
  def change
    create_table :question_responses do |t|
      t.text :text
      t.references :student
      t.references :question

      t.timestamps
    end
    add_index :question_responses, :student_id
    add_index :question_responses, :question_id
  end
end
