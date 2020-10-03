class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def new
    @project = current_user.project.new
  end
end
