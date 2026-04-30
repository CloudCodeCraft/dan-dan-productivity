# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_04_30_003003) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "sessions", force: :cascade do |t|
    t.string "bearer_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "task_timers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "end_time", precision: nil
    t.string "name"
    t.string "notes"
    t.datetime "start_time", precision: nil
    t.bigint "timed_task_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["timed_task_id"], name: "index_task_timers_on_timed_task_id"
    t.index ["user_id"], name: "index_task_timers_on_user_id"
  end

  create_table "timed_projects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.string "notes"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_timed_projects_on_user_id"
  end

  create_table "timed_tasks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.string "notes"
    t.bigint "timed_project_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["timed_project_id"], name: "index_timed_tasks_on_timed_project_id"
    t.index ["user_id"], name: "index_timed_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "password_digest"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "sessions", "users"
  add_foreign_key "task_timers", "timed_tasks"
  add_foreign_key "task_timers", "users"
  add_foreign_key "timed_projects", "users"
  add_foreign_key "timed_tasks", "timed_projects"
  add_foreign_key "timed_tasks", "users"
end
