class Visit < ActiveRecord::Base
 attr_accessible :caller_browser, :caller_host, :caller_ip, :caller_lang, :http_method, :path_from, :path_to, :user_id
  
  def self.log(current_user, request)
    begin
      Visit.create(
            :user_id => !current_user.blank? ? current_user.id : nil, 
            :path_from => request.env["HTTP_REFERER"], 
            :path_to => request.env["REQUEST_PATH"], 
            :http_method => request.env["REQUEST_METHOD"], 
            :caller_ip => request.env["REMOTE_ADDR"], 
            :caller_host => request.env["REMOTE_HOST"], 
            :caller_browser => request.env["HTTP_USER_AGENT"], 
            :caller_lang => request.env["HTTP_ACCEPT_LANGUAGE"])
    rescue Exception => e
      #booboo
    end
  end
  
  end