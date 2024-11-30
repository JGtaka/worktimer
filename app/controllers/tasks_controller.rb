class TasksController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    p @task
    @task.user_id = current_user.id
    p @task
    if @task.save
     redirect_to tasks_path
    else
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:expired_at, :body, :name)
  end

end
