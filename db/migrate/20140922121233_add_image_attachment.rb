class AddImageAttachment < ActiveRecord::Migration
  def self.up
    add_attachment :devices, :avatar
  end

  def self.down
    remove_attachment :devices, :avatar
  end
end
