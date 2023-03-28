class CreateJoinDishesTags < ActiveRecord::Migration[7.0]
  def change
    create_table :join_dishes_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true

      t.timestamps
    end
  end
end
