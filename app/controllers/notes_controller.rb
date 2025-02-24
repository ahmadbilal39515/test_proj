class NotesController < ApplicationController
  before_action :require_login
  before_action :set_note, only: %i[ show edit update destroy ]

  # GET /notes or /notes.json
  def index
    @notes = current_user.notes
  end

  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes or /notes.json
  def create
    @note = current_user.notes.build(note_params)

    respond_to do |format|
      if @note.save
        redirect_to notes_path, notice: "Note created successfully"
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    if @note.update(note_params)
      redirect_to notes_path, notice: "Note updated successfully"
    else
      render :edit
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy!
    redirect_to notes_path, notice: "Note deleted successfully"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = current_user.notes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:title, :message)
    end
end
