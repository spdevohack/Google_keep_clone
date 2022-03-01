class NotebooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  def index
    @notebooks = current_user.notebooks.all.order(:id)
    @empty_note = Notebook.notes_empty
    Notebook.find(@empty_note[0].id).destroy if @empty_note.present?
  end

  def new
    @action = 'new'
    @notebook = Notebook.new()
  end

  def create
    debugger
    @notebook = current_user.notebooks.new(notebook_params) #link every notebook with user 

    if @notebook.save!
      respond_to do |format| 
        format.json{ render json: @notebook.id.to_json}
      end 
    else
      render 'new'
    end
  end

  def edit
    @action = 'edit'
    @notebook = Notebook.find(params[:id])
  end

  def update
    @notebook = Notebook.find(params[:notebook][:id])
    # debugger
    if @notebook.update(notebook_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
    @notebook = Notebook.find(params[:id])
  end

  def destroy
    @notebook = Notebook.find(params[:id])
    @notebook.update(bin: true, note_bin: Date.today)
    redirect_to root_path
  end

  def autosave
    # debugger
    @notebook ||= current_user.notebooks.new(notebook_params)
    @notebook.save
  end

  def remove_bin
    # debugger
    @notebook = Notebook.find(params[:id])
    @notebook.update(bin: false, note_bin: nil)
    redirect_to root_path
  end

  private
  def notebook_params
    params.require(:notebook).permit(:id, :title, :description, :pinned, :date, :time, :note_bin)
  end
end
