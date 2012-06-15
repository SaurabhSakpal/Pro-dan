class CreateUserids < ActiveRecord::Migration
  def self.up
    create_table :userids do |t|
		t.column :user_id, :integer
		t.column :email, :string
		t.column :userid, :string
		t.column :vcode, :string
		t.column :status, :string
		
		t.timestamps
    end
  end
    def self.down
	drop_table :userids
  end
end
