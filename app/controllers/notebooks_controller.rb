class NotebooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @notebooks = Notebook.all.order(:id)
  end

  def new
    @action = 'new'
    @notebook = Notebook.new()
  end

  def create
    @notebook = current_user.notebooks.new(notebook_params) #link every notebook with user 
    if @notebook.save!
      redirect_to notebooks_path, notice: "notebook created successfully"
    else
      render 'new'
    end
  end

  def edit
    @action = 'edit'
    @notebook = Notebook.find(params[:id])
  end

  def update
    @notebook = Notebook.find(params[:id])
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
    @notebook.update(bin: true)
    redirect_to root_path
  end

  def autosave
    # debugger
    @notebook ||= current_user.notebooks.new(notebook_params)

    if  @notebook.persisted? 
      @notebook.update(notebook_params)
    elsif !@notebook.persisted? && @notebook.id_changed?
      @notebook.save  
    end

  end

  private
  def notebook_params
    params.require(:notebook).permit(:title, :description, :pinned, :date, :time)
  end
end
