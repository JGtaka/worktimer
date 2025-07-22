class Task < ApplicationRecord

  belongs_to :user
  has_many :task_shares, dependent: :destroy
  has_many :shared_users, through: :task_shares, source: :user

  validates :expired_at, presence: true
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 20 } 

  # 優先度の定義
  enum priority: { low: 0, medium: 1, high: 2 }

  # 優先度で並び替えるスコープ
  scope :ordered_by_priority, -> { order(priority: :desc,expired_at: :asc) }

end
