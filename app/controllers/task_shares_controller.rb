class TaskSharesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task

  def create
    @task_share = @task.task_shares.new(task_share_params)
    if @task_share.save
    Notification.create!(
       user: @task_share.user,
      message: "タスク「#{@task.name}」が共有されました",
      read: false
    )
      redirect_to task_path(@task), notice: "タスクを共有しました"
    else
      redirect_to task_path(@task), alert: "共有に失敗しました"
    end
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def task_share_params
    params.require(:task_share).permit(:user_id, :can_edit_priority, :can_edit_comment)
  end
end
