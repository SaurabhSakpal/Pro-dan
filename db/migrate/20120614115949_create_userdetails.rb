class CreateUserdetails < ActiveRecord::Migration
  def self.up
    create_table :userdetails do |t|
	  t.column :user_id, :integer
	  t.column :fname, :string
	  t.column  :lname, :string
    end
  end
  def self.down
	drop_table :userdetails
  end
end
