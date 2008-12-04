class AddIdeasUsersJunction < ActiveRecord::Migration
  def self.up
    create_table :ideas_users do |t|
      t.integer :idea_id
      t.integer :user_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :ideas_users
  end
end
