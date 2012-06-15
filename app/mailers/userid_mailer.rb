class UseridMailer < ActionMailer::Base
 def mail_sender(userid)
@userid = userid  
mail(:to => userid.email, :subject => "Email Verification", :from => "saurabh@rebelguru.com")  
end 
end
