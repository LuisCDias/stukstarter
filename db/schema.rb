# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150522165402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "changed_file_commits", force: :cascade do |t|
    t.integer  "commit_id"
    t.integer  "changed_file_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "changed_file_commits", ["changed_file_id"], name: "index_changed_file_commits_on_changed_file_id", using: :btree
  add_index "changed_file_commits", ["commit_id"], name: "index_changed_file_commits_on_commit_id", using: :btree

  create_table "changed_files", force: :cascade do |t|
    t.string   "filename"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "sha"
    t.string   "status"
    t.integer  "additions"
    t.integer  "deletions"
    t.text     "unified_content"
    t.text     "raw_content"
  end

  create_table "changes", force: :cascade do |t|
    t.integer  "changed_file_id"
    t.string   "category"
    t.integer  "line_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "changes", ["changed_file_id"], name: "index_changes_on_changed_file_id", using: :btree

  create_table "commit_repositories", force: :cascade do |t|
    t.integer  "repository_id"
    t.integer  "commit_id"
    t.integer  "language_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "commit_repositories", ["commit_id"], name: "index_commit_repositories_on_commit_id", using: :btree
  add_index "commit_repositories", ["language_id"], name: "index_commit_repositories_on_language_id", using: :btree
  add_index "commit_repositories", ["repository_id"], name: "index_commit_repositories_on_repository_id", using: :btree

  create_table "commits", force: :cascade do |t|
    t.string   "sha"
    t.string   "message"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "url"
    t.integer  "repository_id"
  end

  add_index "commits", ["repository_id"], name: "index_commits_on_repository_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.string   "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lectures", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "position"
    t.integer  "recipe_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lectures", ["recipe_id"], name: "index_lectures_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.integer  "language_id"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "repository_id"
    t.string   "thumbnail"
    t.string   "status"
    t.string   "level"
    t.boolean  "published",     default: false
    t.boolean  "free",          default: false
    t.text     "description"
    t.string   "slug"
  end

  add_index "recipes", ["language_id"], name: "index_recipes_on_language_id", using: :btree
  add_index "recipes", ["repository_id"], name: "index_recipes_on_repository_id", using: :btree
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "repositories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "language_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "url"
    t.integer  "github_id"
    t.string   "full_name"
  end

  add_index "repositories", ["language_id"], name: "index_repositories_on_language_id", using: :btree
  add_index "repositories", ["user_id"], name: "index_repositories_on_user_id", using: :btree

  create_table "steps", force: :cascade do |t|
    t.integer  "position"
    t.text     "content"
    t.integer  "lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "steps", ["lecture_id"], name: "index_steps_on_lecture_id", using: :btree

  create_table "substeps", force: :cascade do |t|
    t.integer  "step_id"
    t.text     "content"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "substeps", ["step_id"], name: "index_substeps_on_step_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "github_access_token"
    t.string   "github_username"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "changed_file_commits", "changed_files"
  add_foreign_key "changed_file_commits", "commits"
  add_foreign_key "changes", "changed_files"
  add_foreign_key "commit_repositories", "commits"
  add_foreign_key "commit_repositories", "languages"
  add_foreign_key "commit_repositories", "repositories"
  add_foreign_key "commits", "repositories"
  add_foreign_key "lectures", "recipes"
  add_foreign_key "recipes", "languages"
  add_foreign_key "recipes", "repositories"
  add_foreign_key "recipes", "users"
  add_foreign_key "repositories", "languages"
  add_foreign_key "repositories", "users"
  add_foreign_key "steps", "lectures"
  add_foreign_key "substeps", "steps"
end
