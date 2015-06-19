class CommentsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_build, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  
  def create
    @build = Build.find(params[:build_id])
    @comment = @build.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    respond_to do |format|
      format.html { redirect_to buld_path(@build)}
      format.js
    end
  end
  
  def destroy
    @build = Build.find(params[:build_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to build_path(@build)}
      format.js
    end
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :build_id, :user)
  end
  
end