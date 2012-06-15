class Userdetail < ActiveRecord::Base
belongs_to :user
validates :user_id, :presence => true
validates :fname, :presence => true
validates :lname, :presence => true
validates :fname, :length => { :minimum => 2 }
validates :lname, :length => { :minimum => 2 }
end
