class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_task, only: [:edit, :show, :update, :destroy]

  def index
    @tasks = current_user.tasks.ordered_by_priority
    @shared_tasks = current_user.shared_tasks.ordered_by_priority
  end

  def show
  end

  def new
    @task = Task.new
    @task.task_shares.build
    @shareable_users = User.where.not(id: current_user.id)
    @priority_options = Task.priorities.keys.map { |p| [p.humanize, p] }
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      if params[:task_share]
      @task_share = @task.task_shares.new(task_share_params)
      @task_share.save
    end
      redirect_to task_path(@task)
    else
      @shareable_users = User.where.not(id: current_user.id)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
     @shareable_users = User.where.not(id: current_user.id)
     @task = Task.find(params[:id])
     @priority_options = Task.priorities.keys.map { |p| [p.humanize, p] }
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
    params.require(:task).permit(
      :expired_at, :name, :body, :priority,
      task_shares_attributes: [:user_id, :can_edit_priority, :can_edit_comment]
    )
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def shared
   @tasks = current_user.shared_tasks
  end

end
