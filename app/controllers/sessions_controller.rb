class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery except: :create

  def new
    redirect_to '/auth/gitlab'
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.new
    reset_session
    session[:user_id] = user.hash
    redirect_to root_url, notice: 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end

  def failure
    redirect_to root_url, alert: "Authentication error: #{params[:message].humanize}"
  end
end
