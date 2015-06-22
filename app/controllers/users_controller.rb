class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  def index
		@users = User.all.page params[:page]
	end

	def show
	end
  
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "#{@user.username} was deleted}"}
    end
  end
  
  
	private
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
  	params.require(:user).permit(:username)
  end
end