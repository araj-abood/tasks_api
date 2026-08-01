class NotesController < ApplicationController
  include CrudActions

  private
  def notes_param
    params.expect(note: [ :content ])
  end
end
