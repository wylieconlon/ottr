class CreateInvites < ActiveRecord::Migration
  def self.up
    create_table :invites do |t|
      t.string :email
      t.integer :idea_id
      t.integer :vote

      t.timestamps
    end
  end

  def self.down
    drop_table :invites
  end
end
