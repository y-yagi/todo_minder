class Tasks::StartsController < ApplicationController
  def update
    @task = current_user.tasks.find(params[:id])
    @task.doing!
    redirect_to tasks_url, notice: 'Task was successfully updated.'
  end
end
