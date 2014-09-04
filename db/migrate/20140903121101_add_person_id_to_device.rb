class AddPersonIdToDevice < ActiveRecord::Migration
  def change
  	add_column :devices, :person_id, :int
  end
end
