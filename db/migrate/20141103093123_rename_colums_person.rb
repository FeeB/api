class RenameColumsPerson < ActiveRecord::Migration
  def change
  	rename_column :people, :firstName, :first_name
  	rename_column :people, :lastName, :last_name
  	rename_column :people, :fullName, :full_name
  	rename_column :people, :hasBookedDevice, :has_booked_device
  end
end
