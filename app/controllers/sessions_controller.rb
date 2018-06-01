class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      flash[:notice] = "Welcome #{user.username}"
      redirect_to dashboard_index_path
    else
      flash[:error] = "#{params[:username]} does not exist"
    end
  end

end
