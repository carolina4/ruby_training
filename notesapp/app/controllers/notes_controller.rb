class NotesController < ApplicationController
  def index
    @notes = Note.all.order(updated_at: :desc)
  end

  # GET /resumes/new
  def new
    @note = Note.new
  end

  # GET /resumes/1
  def show
    note = Note.find(params[:id])
    redirect_to edit_note_path(note)
  end

  # GET /resumes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # POST /resumes
  def create
    note_params = params.require(:note).permit(:title, :note)
    @note = Note.new(note_params)

    if @note.save
      redirect_to notes_path, notice: 'Note was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /resumes/1
  def update
    note_params = params.require(:note).permit(:title, :note)
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to notes_path, notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /resumes/1
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path, notice: 'Note was successfully deleted.'
  end

end
