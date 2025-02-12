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
    p 'hoge1' 
    @task = Task.find(params[:id])
    p 'hoge2'
     @task.update(task_params)
    p 'hoge3'
    redirect_to task_path 
    p 'hoge4'
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
  end

  private
  
  def task_params
    params.require(:task).permit(:expired_at, :name, :body)
  end

  

end
