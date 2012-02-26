class RemoveColumnCommentFromComments < ActiveRecord::Migration
  def self.up
    remove_column :comments, :comment
  end

  def self.down
    add_column :comments, :comment, :string
  end
end
