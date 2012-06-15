class HomeController < ApplicationController
layout 'welcome'
def show
@user = User.new
end

#login
def login
	emal = params[:home]['email']
	passwrd1 = params[:home]['password']
	if emal != nil && passwrd1 != nil
		@user = User.find_by_email(emal)
		passwrd2 = @user.password
		if @user.status == 'NO'
			flash[:notice] = "Verify your email first "
			redirect_to :controller => 'home',:action=>'show'
		else
			if (passwrd1 == passwrd2)
				session[:user_id] = @user.id
				redirect_to :controller => 'profiles',:action=>'show', :id=>@user.id
				flash[:notice] = "successfully logged in"
			else
				redirect_to :controller => 'home',:action=>'show'
				flash[:notice] = "Invalid user name/password"
			end
		end
	else
		reset_session
		flash[:notice] = "Unable to login please. password/email shouldnt be blank"
		redirect_to :controller => 'home',:action=>'show'
	end
end

#logout
def logout
session[:user_id] = nil
reset_session
flash[:notice] = "Successfully LogedOut"
redirect_to :controller => 'home',:action=>'show'
end

end
