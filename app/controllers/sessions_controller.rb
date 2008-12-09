class SessionsController < ApplicationController
  
  def new
  end

  def show
    
  end

  def create

    @current_user = User.authenticate(params[:email], params[:pwd])
    puts "######### #{@current_user}##############"
    if @current_user
      session[:user] = @current_user.id
      redirect_to :controller => 'sessions', :action => 'new'
      flash[:notice] = "Login Successful!"

    else
      render :action => 'new'
      flash[:notice] = "Wrong User/Password"

    end
  end
  
  def destroy
    
    reset_session
    flash[:notice] = "logout successfull"
    redirect_to :action => 'new'
    puts "session destroyed"
    
  end

end
