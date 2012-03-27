class CreateHighschools < ActiveRecord::Migration
  def change
    create_table :highschools do |t|
      t.string :name
      t.references :district

      t.timestamps
    end
    add_index :highschools, :district_id

    add_column :admin_users, :university_id, :integer
    add_column :admin_users, :highschool_id, :integer
    add_column :admin_users, :district_id, :integer
    add_index :admin_users, :district_id
    add_index :admin_users, :university_id
    add_index :admin_users, :highschool_id

  end
end
