class Showcases::CommentsController < CommentsController
  before_action :set_commentable
  
  private
  def set_commentable
    @commentable = Showcase.friendly.find(params[:showcase_id])
  end
end