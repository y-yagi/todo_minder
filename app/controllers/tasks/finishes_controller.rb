class Tasks::FinishesController < ApplicationController
  def show
    @lists = current_user.lists.includes(:tasks).joins(:tasks).merge(Task.finished)
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @task.finished!
    redirect_to tasks_url, notice: 'Task was successfully updated.'
  end

  def fluid?
    true
  end
end
