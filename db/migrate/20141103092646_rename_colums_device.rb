class RenameColumsDevice < ActiveRecord::Migration
  def change
  	rename_column :devices, :deviceName, :device_name
  	rename_column :devices, :deviceId, :device_id
  	rename_column :devices, :isBooked, :is_booked
  	rename_column :devices, :systemVersion, :system_version
  	rename_column :devices, :deviceType, :device_type
  end
end
