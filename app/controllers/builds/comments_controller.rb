class Builds::CommentsController < CommentsController
  before_action :set_commentable
  
  private
  def set_commentable
    @commentable = Build.friendly.find(params[:build_id])
  end
end