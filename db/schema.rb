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

ActiveRecord::Schema.define(version: 20171106033802) do

  create_table "activities", force: :cascade do |t|
    t.integer "user_id"
    t.string "activity_type"
    t.integer "job_id"
    t.date "activity_start"
    t.text "activity_details"
    t.float "hours"
    t.string "state"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_skills", force: :cascade do |t|
    t.integer "activity_id"
    t.integer "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "career_skills", force: :cascade do |t|
    t.integer "user_career_id"
    t.integer "skill_id"
    t.string "weight"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "careers", force: :cascade do |t|
    t.string "career_title"
    t.string "career_description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.integer "user_id"
    t.string "school"
    t.string "level"
    t.string "degree"
    t.string "field_of_study"
    t.date "edu_start"
    t.date "edu_end"
    t.text "edu_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.float "required_skill_multiplier"
    t.float "preferred_skill_multiplier"
    t.float "desired_skill_multiplier"
    t.integer "total_skill_hours"
    t.integer "total_career_hours"
    t.float "hours_in_a_day"
    t.integer "modified_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "skill_title"
    t.string "skill_description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_careers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "career_id"
    t.date "career_start"
    t.date "career_end"
    t.text "career_description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_jobs", force: :cascade do |t|
    t.integer "user_career_id"
    t.integer "user_id"
    t.string "company"
    t.string "job_title"
    t.date "job_start"
    t.date "job_end"
    t.text "job_description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "role"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.text "summary"
    t.string "email"
    t.string "location"
    t.string "contact_no"
    t.string "website"
    t.string "photo"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
