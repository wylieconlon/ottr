class AddOrganizerToIdea < ActiveRecord::Migration
  def self.up
    add_column :ideas, :organizer, :integer
  end

  def self.down
    remove_column :ideas, :organizer
  end
end
