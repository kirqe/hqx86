class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_build, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource


  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    respond_to do |format|
      format.html { redirect_to @commentable, notice: "Your comment was successfully added."}
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @commentable, notice: "The comment was successfully deleted."}
      format.js
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end