class ProfilesController < ApplicationController
before_filter :authenticate
layout 'welcome'

def show
@user = current_user
@user2 = User.find(params[:id]) 
end

def addid
@user = current_user
@user2 = User.find(params[:id]) 
#unique id creation
a = @user.id.to_s
uniqueid = Random.rand(10000...99999).to_s+"U"+a


end

def deleteid
@user = current_user
@user2 = User.find(params[:id]) 
end

end
