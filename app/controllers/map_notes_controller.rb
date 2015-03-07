class MapNotesController < ApplicationController
  protect_from_forgery except: :create
  before_filter :require_login

  def index
    @map_notes = @current_user.map_notes
  end

  def show
  end

  def new
    render layout: 'full_window'
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def require_login
    if !signed_in?
      redirect_to root_path, error: "Login required"
    end
  end
end
