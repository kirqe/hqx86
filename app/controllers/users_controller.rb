class UsersController < ApplicationController
  #before_filter :ensure_trailing_slash, only: [:index, :show]
  before_action :authenticate_user!, except:[:show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @users = User.all.page params[:page]
  end

  def show
    @user_builds = @user.builds.page params[:page]
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "#{@user.username} was deleted"}
    end
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_info, :current_build, :contact_details) #removed :username
  end
end
