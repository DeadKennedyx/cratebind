class ProjectsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :find_project, except: [:index, :new, :create]

  def index
    @projects = Project.all
  end

  def edit; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create!(project_params)
  end

  def update
    @project.update(project_params)
  end

  def destroy
    @project.destroy
  end

  def project_params
    params[:project].permit(:name, tasks_attributes: [:id, :name, :done, :attachment, :_destroy, :attachments_attributes, attachments_attributes: [:image], user_ids: []])
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end
end
