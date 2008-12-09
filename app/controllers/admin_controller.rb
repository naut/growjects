class AdminController < ApplicationController
  
  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:name], params[:password])
        if user
         session[:user_id] = user.id
         redirect_to(:action => "index" )
         puts "redirecting"
        else
          flash.now[:notice] = "Invalid user/password combination"
          puts "error"
         end
      end
     end

  def logout
  end

  def index
  end

end
