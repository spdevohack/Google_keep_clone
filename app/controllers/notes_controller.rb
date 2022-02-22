class NotesController < ApplicationController
  # before_action :notebook, only: [:new, :show]
  def index
    @notebook = Notebook.find(params[:notebook_id])
    @notes =@notebook.notes.all
  end

  def new
    @note = Note.new()
  end

  def create
    debugger
    @note = Note.new(note_params)
    if @note.save
      redirect_to notes_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  private
  def note_params
    params.require(:note).permit(:description, :notebook_id)
  end

  def notebook
    @notebook=Notebook.find(params[:id])
  end
end
