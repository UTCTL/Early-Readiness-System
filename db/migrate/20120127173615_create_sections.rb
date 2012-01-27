class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.text :description
      t.text :error
      t.integer :order

      t.timestamps
    end
  end
end
