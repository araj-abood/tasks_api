class NotesController < ApplicationController
  def index
    @notes = Note.all
  end


  def show
  end

  def create
  end


  def update
  end

  def destroy
  end



  private


  def note_params
    params.expect(note: [ :content ])
  end
end
