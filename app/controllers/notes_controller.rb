class NotesController < ApplicationController
  def create
    @note = Note.new(params)
    if @note.save
      CleanupNotesJob.perform_async
      redirect_to @note, notice: 'Note was successfully created.'
    else
      render :new
    end
  end
end