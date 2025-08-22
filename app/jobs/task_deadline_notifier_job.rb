class TaskDeadlineNotifierJob < ApplicationJob
  queue_as :default

  def perform
    # 24時間以内に期限が来るタスクを取得
    Task.where(expired_at: Time.current..1.day.from_now).find_each do |task|
      # すでに同じ通知が未読で存在する場合はスキップ
      next if Notification.exists?(
        user: task.user,
        message: "タスク「#{task.name}」の期限が近づいています",
        read: false
      )

      Notification.create!(
        user: task.user,
        message: "タスク「#{task.name}」の期限が近づいています",
        read: false
      )
    end
  end
end
