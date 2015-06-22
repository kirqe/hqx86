class Admin::DashboardController < ApplicationController
  def index
    @users = User.limit(20)
    @builds = Build.limit(20)
  end
end
