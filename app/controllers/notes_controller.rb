class NotesController < ApplicationController
  before_action :set_employee
  before_action :set_note, only: %i[ show edit update destroy ]

  # GET /notes or /notes.json
  def index
    @pagy, @notes = pagy(Note.all)
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
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        flash.now[:notice] = "Note was successfully created."
        format.turbo_stream
        format.html { redirect_to note_url(@note) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        flash.now[:notice] = "Note was successfully updated."
        format.html { redirect_to note_url(@note) }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy

    respond_to do |format|
      flash.now[:notice] = "Note was successfully destroyed."
      format.html { redirect_to notes_url }
      format.turbo_stream
    end
  end

  private
    def set_employee
      @employee = Employee.find(params[:employee_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:employee_id, :event_id, :value, :start_date, :end_date, :reference)
    end
end
