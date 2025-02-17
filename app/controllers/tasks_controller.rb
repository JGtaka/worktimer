class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :show]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
     redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @task = Task.find(params[:id])
     @task.update(task_params)
    redirect_to task_path 
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private
  
  def task_params
    params.require(:task).permit(:expired_at, :name, :body)
  end

  def set_post
    @task = Task.find(params[:id])
  end

end
