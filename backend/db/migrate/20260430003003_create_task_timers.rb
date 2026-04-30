class CreateTaskTimers < ActiveRecord::Migration[8.1]
  def change
    create_table :task_timers do |t|
      t.string :name
      t.string :notes
      t.references :user, null: false, foreign_key: true
      t.references :timed_task, null: false, foreign_key: true
      t.timestamp :start_time
      t.timestamp :end_time

      t.timestamps
    end
  end
end
