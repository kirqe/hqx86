class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
	end

	private
	def set_user
		@user = User.find(params[:user])
	end

	def user_params
  	params.require(:user).permit(:username)
  end
end