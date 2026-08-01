require 'rails_helper'

RSpec.describe Note, type: :model do
  describe "Validations" do
    it "Is valid with valid attributes" do
      note = Note.new(content: "Hello my Diaries")

      expect(note).to be_valid
    end
    it "Is invalud with no content attribute" do
      note = Note.new()

      expect(note).not_to be_valid
    end
  end
end
