class AddMessageToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :message, :string
  end

  def self.down
    remove_column :comments, :message
  end
end
