class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :deviceName
      t.string :category
      t.boolean :isBooked
      t.string :deviceId
      t.string :systemVersion

      t.timestamps
    end
  end
end
