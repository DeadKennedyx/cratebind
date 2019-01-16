class TasksController < ApplicationController
  protect_from_forgery with: :exception
  before_action :find_task, except: [:index, :new, :create]

  def edit; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(task_params)
  end

  def update
    @task.update(task_params)
  end

  def destroy
    @task.destroy
  end

  def task_params
    params[:task].permit(:name)
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end
end
