class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  
  layout 'application'
  
  before_filter :login_required?, :except => [:new, :create]
  
  
  
  def index
    @users = User.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @last_id_usr = User.find(:first, :order => 'id DESC')
    @user.id = @last_id_usr.id + 1
    prof_id = new_profile(session[:user])
    @user.profile_id = prof_id
    if @user.save
      @current_user = @user
      session[:user] = @user.id
      flash[:notice] = 'successfuly signed up!'
      redirect_to :action => 'show', :id => @user.id
      
    else
      render :action => 'new'
      flash[:notice] = 'oops, something went wrong!'    
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @profile = Profile.find_by_user_id(params[:id])
    @profile.destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
