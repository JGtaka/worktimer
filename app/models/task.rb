class Task < ApplicationRecord

  belongs_to :user

  validates :expired_at, presence: true
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 20 } #タスクのタイトルに文字数制限を実装

end
