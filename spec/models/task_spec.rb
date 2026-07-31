require 'rails_helper'

RSpec.describe Task, type: :model do
    describe "Validations" do
      it "is valid valid with valid attributes" do
        task = Task.new(task: "New task", completed: false)

        expect(task).to be_valid
      end
      it "is invalid with no task" do
        task = Task.new(task: "", completed: false)
        expect(task).not_to be_valid
        expect(task.errors.to_a).to include("Task can't be blank")
      end
      it "is invalid with completed status" do
        task = Task.new(task: "I am a new task")
        expect(task).not_to be_valid
      end
    end
  end
