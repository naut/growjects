class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.string :avatar
      t.string :website

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
