class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_task, only: [:edit, :show, :update, :destroy]

  def index
    @tasks = current_user.tasks.ordered_by_priority.page(params[:tasks_page]).per(5)
    @shared_tasks = current_user.shared_tasks.ordered_by_priority.page(params[:shared_tasks_page]).per(5)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
  end

  private
  
  def task_params
    params.require(:task).permit(:expired_at, :name, :body, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def shared
   @tasks = current_user.shared_tasks
  end

end
