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

ActiveRecord::Schema.define(version: 20171222023428) do

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "creator_id"
    t.string "image"
    t.string "title"
    t.text "description"
    t.string "location"
    t.string "location_street_number"
    t.string "location_street_name"
    t.string "location_zip"
    t.string "hashtags"
    t.string "url_link"
    t.string "meme_addy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "the_day"
    t.datetime "the_time"
  end

  create_table "memes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "creator_id"
    t.string "image"
    t.string "text"
    t.string "hashtags"
    t.text "description"
    t.string "breed"
    t.string "meme_addy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "creator_id"
    t.string "image"
    t.string "title"
    t.string "hashtag"
    t.text "description"
    t.string "url_link"
    t.string "contact"
    t.string "meme_addy"
    t.integer "price_meme"
    t.string "hashtags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patrons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["confirmation_token"], name: "index_patrons_on_confirmation_token", unique: true
    t.index ["email"], name: "index_patrons_on_email", unique: true
    t.index ["invitation_token"], name: "index_patrons_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_patrons_on_invitations_count"
    t.index ["invited_by_id"], name: "index_patrons_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_patrons_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_patrons_on_reset_password_token", unique: true
  end

end
