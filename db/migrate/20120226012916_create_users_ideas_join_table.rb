class CreateUsersIdeasJoinTable < ActiveRecord::Migration
  def self.change
    create_table :users_ideas, :id => false do |t|
      t.integer :user_id
      t.integer :idea_id
    end
  end
end
