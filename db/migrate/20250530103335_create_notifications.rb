# app/models/user.rb
class User < ApplicationRecord
  has_many :notifications
  # ...既存のコード...
end

# app/models/notification.rb
class Notification < ApplicationRecord
  belongs_to :user
endclass CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :message
      t.boolean :read

      t.timestamps
    end
  end
end
