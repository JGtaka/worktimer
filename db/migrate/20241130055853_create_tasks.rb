class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true, null:false
      t.string :name, null:false, defalut: ''
      t.datetime :expired_at, null: false, defalut: ->{'NOW()'}
      t.text :body, null:true
      t.timestamps
    end
  end
end
