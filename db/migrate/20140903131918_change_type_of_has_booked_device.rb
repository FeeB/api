class ChangeTypeOfHasBookedDevice < ActiveRecord::Migration
  def up
    change_column :people, :hasBookedDevice, :string
  end

  def down
    change_column :people, :hasBookedDevice, :boolean
  end
end
