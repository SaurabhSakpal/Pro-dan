class CreateVisits < ActiveRecord::Migration
  def self.up
    create_table :visits do |t|
		t.column :path_from, :text
		t.column :path_to, :text
		t.column :http_method, :text
		t.column :caller_ip, :string
		t.column :caller_host, :text
		t.column :caller_browser, :text
		t.column :caller_lang, :string
		t.timestamps
    end
  end
  def self.down
	drop_table :visits
  end
end
