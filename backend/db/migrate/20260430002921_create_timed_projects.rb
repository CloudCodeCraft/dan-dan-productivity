class CreateTimedProjects < ActiveRecord::Migration[8.1]
  def change
    create_table :timed_projects do |t|
      t.string :name
      t.string :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
