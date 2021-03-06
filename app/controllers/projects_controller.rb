class ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
    @user_projects = current_user.projects.all
    @user_contacts = current_user.contacts.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = current_user.projects.build
  end

  def edit
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully destroyed.'
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name)
    end
end
