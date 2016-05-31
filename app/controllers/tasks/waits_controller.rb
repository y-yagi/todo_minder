class Tasks::WaitsController < ApplicationController
  def update
    @task = current_user.tasks.find(params[:id])
    @task.wait!
    redirect_to tasks_url, notice: 'Task was successfully updated.'
  end
end
