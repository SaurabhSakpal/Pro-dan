class User < ActiveRecord::Base
has_one	:userdetail, :dependent => :destroy
has_many	:userids, :dependent => :destroy
validates :email, :presence => true
validates :password, :presence => true
validates :password, :length => { :in => 6..30 }
validates :email, :uniqueness => true
end
