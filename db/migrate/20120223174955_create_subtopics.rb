class CreateSubtopics < ActiveRecord::Migration
  def change
    create_table :subtopics do |t|
      t.string :name
      t.references :subject

      t.timestamps
    end
    add_index :subtopics, :subject_id
  end
end
