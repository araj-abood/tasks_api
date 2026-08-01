class NotesController < ApplicationController
  include CrudActions

  private
  def note_params
    params.expect(note: [ :content ])
  end
end
