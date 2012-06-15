class UserMailer < ActionMailer::Base
  
def mail_sender(user)
@user = user  
mail(:to => user.email, :subject => "Email Verification", :from => "saurabh@rebelguru.com")  
end 
end
