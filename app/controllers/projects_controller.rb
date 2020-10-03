class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @projects = current_user.projects
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = 'Project created!'
      redirect_to :root
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = 'Project updated!'
      redirect_to :root
    else
      render 'edit'
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = 'Project deleted!'
    redirect_to :root
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
