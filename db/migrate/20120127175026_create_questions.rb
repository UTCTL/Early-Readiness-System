class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text
      t.integer :order
      t.references :section

      t.timestamps
    end
    add_index :questions, :section_id
  end
end
