class CreateStudentGenders < ActiveRecord::Migration
  def change
    create_table :student_genders do |t|
      t.references :student
      t.references :gender

      t.timestamps
    end
    add_index :student_genders, :student_id
    add_index :student_genders, :gender_id
  end
end
