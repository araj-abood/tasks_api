class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    task = Task.new create_params
    debugger
    if task.save!
      render json: { success: true, data: task }
    end
  end

  def create_params
    params.expect(task: [ :task, :completed ])
  end
end
