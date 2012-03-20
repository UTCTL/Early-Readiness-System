class CreateInterestedUniversities < ActiveRecord::Migration
  def change
    create_table :interested_universities do |t|
      t.references :student
      t.references :university

      t.timestamps
    end
    add_index :interested_universities, :student_id
    add_index :interested_universities, :university_id
  end
end
