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

ActiveRecord::Schema.define(version: 20130802154058) do

  create_table "actors", force: true do |t|
    t.string "name"
    t.string "dob"
    t.text   "bio"
    t.string "image_url"
  end

  create_table "directors", force: true do |t|
    t.string "name"
    t.string "dob"
    t.string "image_url"
    t.text   "bio"
  end

  create_table "movies", force: true do |t|
    t.string  "title"
    t.integer "year"
    t.integer "duration"
    t.text    "description"
    t.string  "image_url"
    t.integer "director_id"
  end

  create_table "roles", force: true do |t|
    t.string  "character_name"
    t.integer "movie_id"
    t.integer "actor_id"
  end

  create_table "users", force: true do |t|
    t.string "name"
    t.string "email"
  end

  create_table "votes", force: true do |t|
    t.integer "user_id"
    t.integer "movie_id"
  end

end
