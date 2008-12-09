class AddResourcesIdeasJunction < ActiveRecord::Migration
  def self.up
    create_table :ideas_resources do |t|
      t.integer :idea_id
      t.integer :resource_id
    end
  end

  def self.down
    drop_table :ideas_resources
  end
end
