class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.string :name
      t.string :desc
      t.string :url
      t.string :mime_type

      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
