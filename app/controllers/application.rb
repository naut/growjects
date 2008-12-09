# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  protect_from_forgery
  
  before_filter :initialize_user
  
  helper_method :logged_in?
  
  
  protected
  
  def initialize_user
    return unless session[:user]
    @current_user = User.find_by_id(session[:user])
  end
  
  def logged_in?
    @current_user.is_a?(User)
  end
  
  def new_profile(user_id)
      
      @last_id = Profile.find(:first, :order => 'id DESC')
      @last_id_usr = User.find(:first, :order => 'id DESC')
      @profile = Profile.new
      @profile.id = @last_id.id += 1
      @profile.user_id = @last_id_usr.id + 1
      @profile.lastname = nil
      @profile.firstname = nil
      @profile.avatar = nil
      @profile.additional_infos = nil
      @profile.save

      @profile.id
   
   end
   
   def user_participation  

      puts "entering participation"
      user = initialize_user
      idea = Idea.find(params[:id])
      if user.working_on_ideas.include?(idea.id)
        flash[:notice] = "you already participate on this idea!"
        redirect_to ideas_path
      else
        user.ideas << idea
        flash[:notice] = "you now paricipate on #{idea.name}!"
        redirect_to ideas_path
      end
   end
   
   def login_required?

    if !logged_in?
      flash[:notice] = 'you need to be logged in to view this site!'
    end
    
    redirect_to :controller => 'sessions', :action => 'new'  unless logged_in?
  end
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  # :secret => 'ed6a6f9ed4fb95402a1de99a2eb715ea'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
