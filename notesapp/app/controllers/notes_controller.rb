class NotesController < ApplicationController
  def index
    @notes = Note.all.order(:updated_at)
  end

  # GET /resumes/new
  def new
    @note = Note.new
  end

  # GET /resumes/1/edit
  def edit
    @note = Resume.find(params[:id])
  end

  # POST /resumes
  def create
  end
end
