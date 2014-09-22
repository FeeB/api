class AddImageUrlRow < ActiveRecord::Migration
  def change
  	add_column :devices, :image_url, :string
  end
end
