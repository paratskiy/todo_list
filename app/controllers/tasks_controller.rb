class TasksController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_task, only: %i[edit update destroy]
  after_action :set_project, only: %i[new]
  after_action only: %i[create update] do
    set_errors(@task)
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_project.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to :root, notice: 'Task was created.' }
        format.json { render :root, status: :created, location: @task }
      else
        format.html { redirect_to :root }
        format.json { render json: @task.errors, status: :unprocessable_entity }
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
      if @task.update(task_params)
        format.html { redirect_to :root, notice: 'Task was updated.' }
        format.json { render :root, status: :ok, location: @task }
      else
        format.html { redirect_to :root }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to :root, notice: 'Task was destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    session[:project] = params.require(:project).permit(:id)
  end

  def task_params
    params.require(:task).permit(:name)
  end

  def current_project
    Project.find_by(session[:project])
  end
end
