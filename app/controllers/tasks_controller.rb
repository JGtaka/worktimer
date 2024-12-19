class TasksController < ApplicationController

  before_action :authenticate_user!

  def index
    @task = Task.all
  end

  def show
    @task = Task.find(params[:id])
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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_paramas)
    redirect_to reques.referer
    else
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:expired_at, :body, :name)
  end

end
