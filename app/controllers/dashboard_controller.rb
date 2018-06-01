class DashboardController < ApplicationController
  before_action :authenticate!

  def index

  end

  private

    def authenticate!
      if current_user.nil?
        flash[:notice] = "Please log in"
        redirect_to root_path
      end
    end

end
