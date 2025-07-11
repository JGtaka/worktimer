class CreateTaskShares < ActiveRecord::Migration[7.0]
  def change
    create_table :task_shares do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.boolean :can_edit_priority
      t.boolean :can_edit_comment

      t.timestamps
    end
  end
end
