require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { deadline_at: @task.deadline_at, detail: @task.detail, list_id: @task.list_id, user_id: @task.user_id, weighting: @task.weighting } }
    end

    assert_redirected_to task_path(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { deadline_at: @task.deadline_at, detail: @task.detail, list_id: @task.list_id, user_id: @task.user_id, weighting: @task.weighting } }
    assert_redirected_to task_path(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_path
  end
end
