class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      
      t.string :name
      t.string :username
      t.string :password_salt
      t.string :password_hash
    end
  end

  def self.down
    drop_table :users
  end
end

