class UsersController < ApplicationController

def create
	s = params[:user]['email']
	k = params[:user]['password']
	m = params[:user]['confirm_password']
	fn = params[:user]['fname']
	ln = params[:user]['lname']
	if k!=m
		flash[:notice] = 'Two Passwords dont match '
		redirect_to :controller=> 'home', :action=> 'show'
	else
		if  ((fn == "")||(ln==""))||((fn.length<=2)||(ln.length<=2))
			if((fn == "")||(ln==""))
			flash[:notice] = 'First name and last name cant be blank'
			redirect_to :controller=> 'home', :action=> 'show'
			else
				flash[:notice] = 'First name and last name too short'
				redirect_to :controller=> 'home', :action=> 'show'
			end
			
		else
			params[:user] = {:email => s, :password => k, :status => 'NO'}
			@user = User.create(params[:user])
			if @user.id!= nil
				code = (0...8).map{('a'..'z').to_a[rand(26)]}.join
				arr = s.split('@')
				code = code + arr[0]+ @user.id.to_s
				@user.update_attributes(:vcode=> code)
				params[:userdetail] = {:user_id=> @user.id, :fname => fn, :lname => ln}
				@userd = Userdetail.create(params[:userdetail])
				if @userd.id != nil
					UserMailer.mail_sender(@user).deliver
					flash[:notice] = 'Verification mail has been sent'
					redirect_to :controller=> 'home', :action=> 'show'
				end 
			else
				arr = @user.errors.full_messages
				str = ''
				arr.each do |a|
					str = str +' '+ a
				end
				flash[:notice] = str 
				redirect_to :controller=> 'home', :action=> 'show'
			end
		end
	end
end

def verify
@user = User.find_by_vcode(params[:id])
@user.status = 'YES'
if @user.save
flash[:notice] = "Email verified"
redirect_to :controller=> 'home', :action=> 'show'
else
flash[:notice] = "Email can't be verified"
redirect_to :controller=> 'home', :action=> 'show'
end
end





end









