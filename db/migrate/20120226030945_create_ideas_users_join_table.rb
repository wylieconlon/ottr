class CreateIdeasUsersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :ideas_users, :id => false do |t|
      t.integer :idea_id
      t.integer :user_id
    end
  end
  
  def self.down
    drop_table :ideas_users
  end
end