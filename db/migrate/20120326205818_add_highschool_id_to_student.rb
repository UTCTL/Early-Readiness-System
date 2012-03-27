class AddHighschoolIdToStudent < ActiveRecord::Migration
  def change
  	add_column :students, :highschool_id, :integer
  	add_index :students, :highschool_id
  end
end
