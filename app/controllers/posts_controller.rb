class PostsController < ApplicationController
  before_action :authenticate!

  def new
    @post = Post.new()
  end

  def create
    post = Post.new(author: current_user.username, body: post_params[:body], user_id: current_user.id)
    if post.save
      redirect_to posts_path
    else
      flash[:error] = "couldn't create your post"
      redirect_to dashboard_index_path
    end
  end

  def index
    @posts = Post.all
  end

  private

    def authenticate!
      if current_user.nil?
        flash[:notice] = "Please log in"
        redirect_to root_path
      end
    end

    def post_params
      params.require(:post).permit(:body)
    end

end
