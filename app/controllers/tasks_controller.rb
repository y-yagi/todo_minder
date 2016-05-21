class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_lists, only: [:index, :create, :edit, :update, :destroy]

  def index
    @task = Task.new
  end

  def show
  end

  def new
    @list = current_user.lists.find(params[:list_id])
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.build(task_params, current_user)

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  def fluid?
    true
  end

  private
    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    def set_lists
      @lists = current_user.lists.includes(:tasks).joins(:tasks).merge(Task.active)
    end

    def task_params
      params[:task][:tags] = params[:task][:tags].split(',') if params[:task][:tags]
      params.require(:task).permit(:detail, :list_id, :deadline_at, :point, tags: [])
    end
end
