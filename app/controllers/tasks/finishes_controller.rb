class Tasks::FinishesController < ApplicationController
  def update
    @task = current_user.tasks.find(params[:id])
    @task.update!(finished: true)
    redirect_to tasks_url, notice: 'Task was successfully finished.'
  end
end
