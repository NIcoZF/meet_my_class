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

ActiveRecord::Schema.define(version: 2019_05_17_151004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "klasses", force: :cascade do |t|
    t.bigint "teacher_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_klasses_on_teacher_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "klasse_id"
    t.datetime "invited_at"
    t.datetime "connect_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["klasse_id"], name: "index_participations_on_klasse_id"
    t.index ["student_id"], name: "index_participations_on_student_id"
  end

  create_table "progressions", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "step_id"
    t.bigint "klasse_id"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["klasse_id"], name: "index_progressions_on_klasse_id"
    t.index ["step_id"], name: "index_progressions_on_step_id"
    t.index ["student_id"], name: "index_progressions_on_student_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "student_id"
    t.string "text"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_questions_on_student_id"
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "klass_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["klass_id"], name: "index_steps_on_klass_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  create_table "upvotes", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "question_id"
    t.boolean "upvote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_upvotes_on_question_id"
    t.index ["student_id"], name: "index_upvotes_on_student_id"
  end

  add_foreign_key "klasses", "teachers"
  add_foreign_key "participations", "klasses", column: "klasse_id"
  add_foreign_key "participations", "students"
  add_foreign_key "progressions", "klasses", column: "klasse_id"
  add_foreign_key "progressions", "steps"
  add_foreign_key "progressions", "students"
  add_foreign_key "questions", "students"
  add_foreign_key "steps", "klasses"
  add_foreign_key "upvotes", "questions"
  add_foreign_key "upvotes", "students"
end