module Admin
  # Unscoped is used to bypass the `acts_as_paranoid` filter.
  class MapNotesController < AdminController
    protect_from_forgery except: :create

    responders :flash
    respond_to :html, :json

    def index
      @map_notes = MapNote.unscoped.all
      respond_with(@map_notes)
    end

    def show
      @map_note = MapNote.unscoped.find_by(id: params[:id])
      respond_with(@map_note, layout: 'map-notes')
    end

    def destroy
      @map_note = MapNote.unscoped.find_by(id: params[:id])
      @map_note.destroy
      redirect_to admin_map_notes_path, notice: "Map note deleted."
    end
  end
end
