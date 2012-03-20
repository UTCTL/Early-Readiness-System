class TryAddingGenderIdColumnAgain < ActiveRecord::Migration
  def change
  	add_column :students, :gender_id, :integer
  end
end
