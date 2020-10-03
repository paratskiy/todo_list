class ProjectsController < ApplicationController
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
