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
  end

  def edit
  end

  def destroy
  end
end
