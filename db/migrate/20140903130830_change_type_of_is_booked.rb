class ChangeTypeOfIsBooked < ActiveRecord::Migration
  def up
    change_column :devices, :isBooked, :string
  end

  def down
    change_column :devices, :isBooked, :boolean
  end
end
