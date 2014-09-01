class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :firstName
      t.string :lastName
      t.boolean :hasBookedDevice
      t.string :userName
      t.string :fullName

      t.timestamps
    end
  end
end
