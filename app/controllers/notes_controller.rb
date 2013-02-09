class NotesController < ApplicationController
  def list
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params[:note])
    if @note.save
      redirect_to notes_list_path, :notice => "Note created."
    else
      render "new"
    end
  end

  def show
    load_user_by_id
  end

  def edit
  end

  def destroy
  end

  private 
  def load_user_by_id
    if params.has_key?(:id)
      @note = Note.find(params[:id])
      redirect_to notes_list_path, :alert => "Note not found." unless @note
    else
      redirect_to notes_list_path, :alert => "Parameter :id is missing."
    end
  end

end
