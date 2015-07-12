class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  authorize_resource :class => false
  
  def index
    @users = User.limit(10)
    @builds = Build.limit(10)
    @posts = Post.limit(10)
  end
  
  def posts
    @posts = Post.includes(:comments).page params[:page]
  end
  
  def builds
    @builds = Build.all.page params[:page]
  end
    
  def users
    @users = User.all.page params[:page]
  end
end
