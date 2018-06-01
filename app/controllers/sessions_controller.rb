class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.username}"
      redirect_to dashboard_index_path
    else
      flash[:error] = "#{params[:username]} does not exist"
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have logged out."
    redirect_to root_path
  end

end
