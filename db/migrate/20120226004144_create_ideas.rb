class CreateIdeas < ActiveRecord::Migration
  def self.up
    create_table :ideas do |t|
      t.string :what
      t.string :where
      t.string :when
      t.string :who

      t.timestamps
    end
  end

  def self.down
    drop_table :ideas
  end
end
