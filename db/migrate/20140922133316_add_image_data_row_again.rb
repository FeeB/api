class AddImageDataRowAgain < ActiveRecord::Migration
  def change
  	 add_column :devices, :image_data_encoded, :string
  end
end
