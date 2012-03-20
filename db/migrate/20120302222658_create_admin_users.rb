class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :name
      t.string :eid
      t.string :role

      t.timestamps
    end
  end
end
