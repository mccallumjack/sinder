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

ActiveRecord::Schema.define(version: 20150717225759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "repos", force: :cascade do |t|
    t.integer  "github_repo_id"
    t.string   "url"
    t.string   "name"
    t.string   "full_name"
    t.string   "html_url"
    t.text     "description"
    t.datetime "pushed_at"
    t.integer  "stargazers_count"
    t.integer  "forks_count"
    t.string   "language"
    t.integer  "open_issues_count"
    t.integer  "contributors_count"
    t.integer  "pull_request_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_repo_actions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "repo_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "github_user_id"
    t.string   "github_login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
