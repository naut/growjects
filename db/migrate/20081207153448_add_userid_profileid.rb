class AddUseridProfileid < ActiveRecord::Migration
  def self.up
    add_column :users, :profile_id, :integer
    add_column :profiles, :user_id, :integer
    end

  def self.down
    remove_column :users, :profile_id
    remove_column :profiles, :user_id
  end
end
