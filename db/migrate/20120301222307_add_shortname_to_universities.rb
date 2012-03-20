class AddShortnameToUniversities < ActiveRecord::Migration
  def change
  	add_column :universities, :shortname, :string
  end
end
