class ProfilesController < ApplicationController
before_filter :authenticate
layout 'welcome'

def show
@user = current_user
end

def addid
@user = current_user
#unique id creation
a = @user.id.to_s
uniqueid = Random.rand(10000...99999).to_s+"U"+a
#verificationcode
code = (0...8).map{('a'..'z').to_a[rand(26)]}.join
p = @user.email
arr = p.split('@')
code = arr[0]+code+@user.id.to_s
params[:profile] = {:user_id=> @user.id, :email => @user.email, :userid => uniqueid, :vcode => code, :status => 'NO'}
@userid = @user.userids.create(params[:profile])
UseridMailer.mail_sender(@userid).deliver
flash[:notice] = 'Verification mail has been sent and the USER ID is created'
redirect_to :controller=> 'profiles', :action=> 'show'
end

def verify
@userid = Userid.find_by_vcode(params[:id])
@userid.status = 'YES'
if @userid.save
flash[:notice] = "Unique User Id verified"
redirect_to :controller=> 'profiles', :action=> 'show'
else
flash[:notice] = "Unique User can't be verified"
redirect_to :controller=> 'profiles', :action=> 'show'
end
end

end
