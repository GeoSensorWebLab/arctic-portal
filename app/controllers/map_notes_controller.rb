class MapNotesController < ApplicationController
  protect_from_forgery except: :create
  before_action :require_login

  responders :flash
  respond_to :html, :json

  def index
    @map_notes = @current_user.map_notes
    respond_with(@map_notes)
  end

  def show
    @map_note = @current_user.map_notes.find_by(id: params[:id])
    respond_with(@map_note, layout: 'map-notes')
  end

  def new
    render layout: 'map-notes'
  end

  def create
    @map_note = @current_user.map_notes.create(map_note_params)
    respond_with(@map_note, location: -> { map_note_path(@map_note) })
  end

  def destroy
    @map_note = @current_user.map_notes.find_by(id: params[:id])
    @map_note.destroy
    redirect_to map_notes_path, notice: "Map note deleted."
  end

  private

  def map_note_params
    params.require(:map_note).permit([:comment, :feature])
  end

  def require_login
    if !signed_in?
      redirect_to root_path, alert: "Please login to use that feature."
    end
  end
end
