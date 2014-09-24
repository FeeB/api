class AddDeviceType < ActiveRecord::Migration
  def change
  	add_column :devices, :deviceType, :string
  end
end
