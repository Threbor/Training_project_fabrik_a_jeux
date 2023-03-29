class AddPhotoToDish < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :photo, :string, default: "no photo"
  end
end
