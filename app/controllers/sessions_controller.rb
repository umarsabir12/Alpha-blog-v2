class SessionsController < ApplicationController

  def new

  end

  def create
  
   user = User.find_by(email: params[:session][:email].downcase)
   if user && user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    flash[:notice] = "logged in "
     redirect_to user
  else
       flash[:alert] = "There is something wrong with your login details" 
       render 'new'   
   end
  end

  def destroy
    
    session[:user_id] = nil
    flash[:notice] = "logout"
    redirect_to root_path 
  end

end
