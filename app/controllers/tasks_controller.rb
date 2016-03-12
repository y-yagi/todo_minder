class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_lists, only: [:index, :create, :edit, :update, :destroy]

  # GET /tasks
  def index
    @task = Task.new
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @list = current_user.lists.find(params[:list_id])
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.build(task_params, current_user)

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def set_lists
      @lists = current_user.lists.includes(:tasks)
    end

    def task_params
      params.require(:task).permit(:detail, :list_id, :deadline_at, :point)
    end
end
