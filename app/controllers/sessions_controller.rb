class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery except: :create

  def new
    redirect_to '/auth/developer'
  end

  def create
    auth = request.env["omniauth.auth"]
    unless @auth = Authorization.find_from_hash(auth)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    # Log the authorizing user in.
    self.current_user = @auth.user

    redirect_to root_path, notice: "Welcome, #{current_user.identity}."
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Signed out!'
  end

  def failure
    redirect_to root_url, alert: "Authentication error: #{params[:message].humanize}"
  end
end
