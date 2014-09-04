class ChangenameOfUsername < ActiveRecord::Migration
  def change
  	rename_column :people, :userName, :username
  end
end
