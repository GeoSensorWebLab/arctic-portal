class MapNotesController < ApplicationController
  protect_from_forgery except: :create
  before_filter :require_login

  responders :flash
  respond_to :html, :json

  def index
    @map_notes = @current_user.map_notes
    respond_with(@map_notes)
  end

  def show
  end

  def new
    render layout: 'map-notes'
  end

  def edit
  end

  def create
    @map_note = @current_user.map_notes.create(map_note_params)
    respond_with(@map_note, location: -> { map_note_path(@map_note) })
  end

  def update
  end

  def destroy
  end

  private

  def map_note_params
    params.require(:map_note).permit(:comment, :feature)
  end

  def require_login
    if !signed_in?
      redirect_to root_path, error: "Login required"
    end
  end
end
