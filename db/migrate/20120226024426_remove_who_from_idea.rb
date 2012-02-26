class RemoveWhoFromIdea < ActiveRecord::Migration
  def self.up
    remove_column :ideas, :who
  end

  def self.down
    add_column :ideas, :who, :string
  end
end
