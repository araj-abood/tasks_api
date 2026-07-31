class TasksController < ApplicationController
  before_action :find_task, only: [ :destroy, :show, :update ]

  def index
    @tasks = Task.all
  end

  def create
    task = Task.new article_params
    if task.save!
      render json: { success: true, data: task }, status: :created
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if task.destroy!
        head :no_content
    end
  end

  def update
    if @task.update(article_params)
      render json: { success: true, data: @task }, status: :ok
    end
  end

  def show
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end


  def article_params
    params.expect(task: [ :task, :completed ])
  end
end
