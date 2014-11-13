class Association < ActiveRecord::Migration
  def change
  	remove_column :devices, :person_id
  	belongs_to :devices, :person
  end
end
