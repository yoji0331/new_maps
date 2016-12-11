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

ActiveRecord::Schema.define(version: 20161210222010) do

  create_table "data", force: :cascade do |t|
    t.integer  "survey_id"
    t.string   "site_name"
    t.string   "reseacher_name"
    t.datetime "date"
    t.string   "weather"
    t.float    "temperature"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "value1"
    t.float    "value2"
    t.float    "value3"
    t.float    "value4"
    t.float    "value5"
    t.float    "value6"
    t.float    "value7"
    t.float    "value8"
    t.float    "value9"
    t.float    "value10"
    t.float    "value11"
    t.float    "value12"
    t.float    "value13"
    t.float    "value14"
    t.float    "value15"
    t.float    "value16"
    t.float    "value17"
    t.float    "value18"
    t.float    "value19"
    t.float    "value20"
    t.float    "value21"
    t.float    "value22"
    t.float    "value23"
    t.float    "value24"
    t.float    "value25"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

end
