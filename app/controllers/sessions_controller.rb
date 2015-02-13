class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    redirect_to '/auth/developer'
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
