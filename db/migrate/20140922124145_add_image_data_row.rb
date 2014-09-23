class AddImageDataRow < ActiveRecord::Migration
  def change
  	add_column :devices, :image_data, :string
  end
end
