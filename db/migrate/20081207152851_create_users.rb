class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :enc_pwd
      t.string :salt
      t.string :nick

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
