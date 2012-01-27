class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :residency
      t.string :email
      t.date :birthday
      t.string :gender
      t.string :highschool

      t.timestamps
    end
  end
end
