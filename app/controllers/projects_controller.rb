class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_project, only: %i[edit update destroy]
  after_action :set_errors, only: %i[create update]

  def index
    @projects = current_user.projects
  end

  def new
    @project = current_user.projects.new
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
    end
  end

  def create
    @project = current_user.projects.build(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to :root, notice: 'Project was created.' }
        format.json { render :root, status: :created, location: @project }
      else
        format.html { redirect_to :root }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to :root, notice: 'Project was updated.' }
        format.json { render :root, status: :ok, location: @project }
      else
        format.html { redirect_to :root }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to :root, notice: 'Project was destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end

  def set_errors
    session[:errors] = @project.errors.full_messages
  end
end
