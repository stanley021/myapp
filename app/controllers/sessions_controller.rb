class SessionsController < ApplicationController
  def new

  end

  def create
        
    user = User.find_by(email: params[:session][:email])
    
    if user
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
      

        redirect_to '/'
      end
    end
  end

  def new
    @curruser = User.new
    @curruser.name = "Guest"
    if current_user
      @curruser = User.find_by(id: current_user.id)
    end

  end
end
