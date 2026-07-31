class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    task = Task.new create_params
    if task.save!
      render json: { success: true, data: task }, status: :created
    end
  end

  def create_params
    params.expect(task: [ :task, :completed ])
  end
end
