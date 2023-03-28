class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :title
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
