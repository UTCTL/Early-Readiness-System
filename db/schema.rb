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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120326212939) do

  create_table "admin_users", :force => true do |t|
    t.string   "name"
    t.string   "eid"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "university_id"
    t.integer  "highschool_id"
    t.integer  "district_id"
  end

  add_index "admin_users", ["district_id"], :name => "index_admin_users_on_district_id"
  add_index "admin_users", ["highschool_id"], :name => "index_admin_users_on_highschool_id"
  add_index "admin_users", ["university_id"], :name => "index_admin_users_on_university_id"

  create_table "district_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "district_users", ["email"], :name => "index_district_users_on_email", :unique => true
  add_index "district_users", ["reset_password_token"], :name => "index_district_users_on_reset_password_token", :unique => true

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exams", :force => true do |t|
    t.string   "name"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "required_score"
    t.integer  "subtopic_id"
    t.string   "shortname"
    t.string   "subshortname"
    t.string   "displayname"
  end

  add_index "exams", ["subject_id"], :name => "index_exams_on_subject_id"
  add_index "exams", ["subtopic_id"], :name => "index_exams_on_subtopic_id"

  create_table "genders", :force => true do |t|
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "highschools", :force => true do |t|
    t.string   "name"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "highschools", ["district_id"], :name => "index_highschools_on_district_id"

  create_table "interested_universities", :force => true do |t|
    t.integer  "student_id"
    t.integer  "university_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interested_universities", ["student_id"], :name => "index_interested_universities_on_student_id"
  add_index "interested_universities", ["university_id"], :name => "index_interested_universities_on_university_id"

  create_table "question_options", :force => true do |t|
    t.text     "prompt"
    t.integer  "order"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_options", ["question_id"], :name => "index_question_options_on_question_id"

  create_table "question_responses", :force => true do |t|
    t.text     "text"
    t.integer  "student_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_responses", ["question_id"], :name => "index_question_responses_on_question_id"
  add_index "question_responses", ["student_id"], :name => "index_question_responses_on_student_id"

  create_table "questions", :force => true do |t|
    t.text     "text"
    t.integer  "order"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["section_id"], :name => "index_questions_on_section_id"

  create_table "scores", :force => true do |t|
    t.integer  "student_score"
    t.integer  "student_id"
    t.integer  "exam_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scores", ["exam_id"], :name => "index_scores_on_exam_id"
  add_index "scores", ["student_id"], :name => "index_scores_on_student_id"

  create_table "sections", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "error"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_genders", :force => true do |t|
    t.integer  "student_id"
    t.integer  "gender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_genders", ["gender_id"], :name => "index_student_genders_on_gender_id"
  add_index "student_genders", ["student_id"], :name => "index_student_genders_on_student_id"

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "residency"
    t.string   "email"
    t.date     "birthday"
    t.string   "highschool_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gender_id"
    t.string   "eid"
    t.boolean  "accepted"
    t.integer  "highschool_id"
  end

  add_index "students", ["highschool_id"], :name => "index_students_on_highschool_id"

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subtopics", :force => true do |t|
    t.string   "name"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subtopics", ["subject_id"], :name => "index_subtopics_on_subject_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "universities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
    t.integer  "section_id"
    t.string   "shortname"
  end

  add_index "universities", ["section_id"], :name => "index_universities_on_section_id"
  add_index "universities", ["student_id"], :name => "index_universities_on_student_id"

  create_table "views", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "views", ["email"], :name => "index_views_on_email", :unique => true
  add_index "views", ["reset_password_token"], :name => "index_views_on_reset_password_token", :unique => true

end
