class CallbacksController < ApplicationController
  def facebook
    @user = User.from_oath(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
end
