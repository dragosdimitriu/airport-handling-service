# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  
   def get_access

       unless Users.find_by_id(session[:user_id])

           flash[:error] = "Please login first"
           redirect_to(:controller => "users", :action => "login")

       end

   end
   
   def current_user
     user = Users.find(session[:user_id])
     user.name
   end

   protected

   def admin?

       if Users.find_by_id(session[:user_id]) and Users.find_by_id(session[:user_id]).username == "admin"
             true
       else
         false
       end
   end
end
