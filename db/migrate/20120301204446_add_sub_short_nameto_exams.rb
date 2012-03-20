class AddSubShortNametoExams < ActiveRecord::Migration
  def change
  	add_column :exams, :subshortname, :string
  end
end
