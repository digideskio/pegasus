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

ActiveRecord::Schema.define(version: 20160218120138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "flags",                  default: 1
    t.datetime "deleted_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree

  create_table "announcements", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "header"
    t.string   "announcement"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "announcements", ["account_id"], name: "index_announcements_on_account_id", using: :btree

  create_table "answers", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "question_id"
    t.string   "answer"
    t.integer  "app_id"
    t.integer  "deleted_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "answers", ["account_id"], name: "index_answers_on_account_id", using: :btree
  add_index "answers", ["app_id"], name: "index_answers_on_app_id", using: :btree
  add_index "answers", ["deleted_at"], name: "index_answers_on_deleted_at", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "api_calls", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "app_id"
    t.string   "endpoint"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "api_calls", ["account_id"], name: "index_api_calls_on_account_id", using: :btree
  add_index "api_calls", ["app_id"], name: "index_api_calls_on_app_id", using: :btree

  create_table "bans", force: :cascade do |t|
    t.integer  "account_id"
    t.datetime "banned_until"
    t.integer  "moderator_id"
    t.string   "reason"
    t.string   "appeal"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "bans", ["account_id"], name: "index_bans_on_account_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "answer_id"
    t.string   "comment"
    t.integer  "app_id"
    t.integer  "deleted_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "comments", ["account_id"], name: "index_comments_on_account_id", using: :btree
  add_index "comments", ["answer_id"], name: "index_comments_on_answer_id", using: :btree
  add_index "comments", ["app_id"], name: "index_comments_on_app_id", using: :btree
  add_index "comments", ["deleted_at"], name: "index_comments_on_deleted_at", using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "destination_id"
    t.integer  "mode",           default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "follows", ["account_id"], name: "index_follows_on_account_id", using: :btree
  add_index "follows", ["destination_id"], name: "index_follows_on_destination_id", using: :btree

  create_table "group_people", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_people", ["account_id"], name: "index_group_people_on_account_id", using: :btree
  add_index "group_people", ["group_id"], name: "index_group_people_on_group_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "name"
    t.boolean  "private"
    t.boolean  "hide_member_blocks"
    t.boolean  "replace_home"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "groups", ["account_id"], name: "index_groups_on_account_id", using: :btree

  create_table "hearts", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "entity_id"
    t.string   "entity_type"
    t.boolean  "loved",       default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "hearts", ["account_id"], name: "index_hearts_on_account_id", using: :btree
  add_index "hearts", ["entity_type", "entity_id"], name: "index_hearts_on_entity_type_and_entity_id", using: :btree

  create_table "inboxes", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "question_id"
    t.boolean  "new",         default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "inboxes", ["account_id"], name: "index_inboxes_on_account_id", using: :btree
  add_index "inboxes", ["deleted_at"], name: "index_inboxes_on_deleted_at", using: :btree
  add_index "inboxes", ["question_id"], name: "index_inboxes_on_question_id", using: :btree

  create_table "logins", force: :cascade do |t|
    t.integer  "account_id"
    t.inet     "ip"
    t.boolean  "success"
    t.string   "useragent"
    t.string   "session_key"
    t.datetime "remember_until"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "logins", ["account_id"], name: "index_logins_on_account_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.integer  "entity_id"
    t.string   "entity_type"
    t.boolean  "new",         default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "notifications", ["account_id"], name: "index_notifications_on_account_id", using: :btree
  add_index "notifications", ["answer_id"], name: "index_notifications_on_answer_id", using: :btree
  add_index "notifications", ["entity_type", "entity_id"], name: "index_notifications_on_entity_type_and_entity_id", using: :btree
  add_index "notifications", ["question_id"], name: "index_notifications_on_question_id", using: :btree

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.integer  "owner_id",                  null: false
    t.integer  "owner_type",                null: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["owner_id", "owner_type"], name: "index_oauth_applications_on_owner_id_and_owner_type", using: :btree
  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "name"
    t.string   "bio"
    t.string   "header"
    t.integer  "ribbons",    default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "profiles", ["account_id"], name: "index_profiles_on_account_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "question"
    t.integer  "private",       default: 0,     null: false
    t.boolean  "anonymous",     default: false, null: false
    t.integer  "app_id"
    t.integer  "deleted_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "questions", ["account_id"], name: "index_questions_on_account_id", using: :btree
  add_index "questions", ["app_id"], name: "index_questions_on_app_id", using: :btree
  add_index "questions", ["deleted_at"], name: "index_questions_on_deleted_at", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "entity_id"
    t.string   "entity_type"
    t.integer  "entity_owner_id"
    t.string   "reason"
    t.integer  "assignee_id"
    t.string   "action_taken"
    t.integer  "status",          default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "reports", ["account_id"], name: "index_reports_on_account_id", using: :btree
  add_index "reports", ["assignee_id"], name: "index_reports_on_assignee_id", using: :btree
  add_index "reports", ["entity_owner_id"], name: "index_reports_on_entity_owner_id", using: :btree
  add_index "reports", ["entity_type", "entity_id"], name: "index_reports_on_entity_type_and_entity_id", using: :btree

  create_table "ribbons", force: :cascade do |t|
    t.string   "name"
    t.string   "icon_class"
    t.integer  "color"
    t.integer  "font_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.integer  "account_id"
    t.boolean  "allow_anonymous_questions"
    t.boolean  "hide_follower_blocks"
    t.boolean  "display_themes"
    t.boolean  "private_account"
    t.boolean  "show_in_public"
    t.boolean  "show_in_search"
    t.boolean  "explicit"
    t.boolean  "display_ribbon_mask"
    t.boolean  "username_ribbon_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "settings", ["account_id"], name: "index_settings_on_account_id", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "entity_id"
    t.string   "entity_type"
    t.boolean  "subscribed",  default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "subscriptions", ["account_id"], name: "index_subscriptions_on_account_id", using: :btree
  add_index "subscriptions", ["entity_type", "entity_id"], name: "index_subscriptions_on_entity_type_and_entity_id", using: :btree

  create_table "themes", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "primary_color"
    t.integer  "secondary_color"
    t.integer  "accent_color"
    t.integer  "font_color"
    t.integer  "secondary_font_color"
    t.integer  "accent_font_color"
    t.integer  "background_color"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "themes", ["account_id"], name: "index_themes_on_account_id", using: :btree

end
