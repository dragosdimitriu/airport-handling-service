class UsersController < ApplicationController
  
  before_filter :get_access, :except => ['register', 'login', 'logout']


  def login
    session[:user_id] = nil
      if request.post?
          user = Users.login(params[:username], params[:password])
          if user  && user.username == 'admin'
            session[:user_id] = user.id
            redirect_to flight_types_path
          else
            if user 
                session[:user_id] = user.id
                redirect_to service_requests_path
            else
                flash[:error] = "Invalid username/password"
            end
          end
      end
  end

  def register
      @user = Users.new(params[:user])
      if request.post? and @user.save
          flash[:notice] = "Account was succesfullt cretaed."
          redirect_to service_requests_path
      end
  end

  def logout
      session[:user_id] = nil
      flash[:notice] = "Logged out"
      redirect_to(:action => "login")
  end
  
end
