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
      redirect_to notes_list_path, :notice => t("common.entry_created")
    else
      render "new"
    end
  end

  def show
    load_note_by_id
  end

  def edit
    load_note_by_id
  end

  def update
    load_note_by_id
    if @note.update_attributes(params[:note])
      redirect_to notes_list_path, :notice => t("common.entry_updated")
    else
      render "edit"
    end
  end

  def destroy
    load_note_by_id
    @note.destroy
    redirect_to notes_list_path, :notice => t("common.entry_deleted")
  end

  private 
  def load_note_by_id
    if params.has_key?(:id)
      @note = Note.find(params[:id])
      redirect_to notes_list_path, :alert => "Note not found." unless @note
    else
      redirect_to notes_list_path, :alert => "Parameter :id is missing."
    end
  end

end
