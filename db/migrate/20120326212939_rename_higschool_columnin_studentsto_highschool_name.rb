class RenameHigschoolColumninStudentstoHighschoolName < ActiveRecord::Migration
  def up
  	 rename_column :students, :highschool, :highschool_name
  end

  def down
  end
end
