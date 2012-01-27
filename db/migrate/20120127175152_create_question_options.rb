class CreateQuestionOptions < ActiveRecord::Migration
  def change
    create_table :question_options do |t|
      t.text :prompt
      t.integer :order
      t.references :question

      t.timestamps
    end
    add_index :question_options, :question_id
  end
end
