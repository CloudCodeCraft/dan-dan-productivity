class CreateTimedTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :timed_tasks do |t|
      t.string :name
      t.string :notes
      t.references :user, null: false, foreign_key: true
      t.references :timed_project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
