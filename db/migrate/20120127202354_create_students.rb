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
      t.boolean :interested_ut, :default => false
      t.boolean :interested_atm, :default => false

      t.timestamps
    end
  end
end
