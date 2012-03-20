class FixTables < ActiveRecord::Migration
	def change
	
	add_column :universities, :student_id, :integer
	add_column :universities, :section_id, :integer
	add_index :universities, :student_id
	add_index :universities, :section_id
	end
end
