class AddUserColumn < ActiveRecord::Migration
  def self.up
	add_column :users ,:vcode, :string
	add_column :users ,:status, :string
  end

  def self.down
	remove_column :user, :vcode
	remove_column :user, :status
  end
end
