class WelcomesController < ApplicationController
  # GET /welcomes
  # GET /welcomes.xml
  def index


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @welcomes }
    end
  end

end
