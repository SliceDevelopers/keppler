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

ActiveRecord::Schema.define(version: 2019_06_03_011323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["owner_type", "owner_id"], name: "index_activities_on_owner_type_and_owner_id"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["recipient_type", "recipient_id"], name: "index_activities_on_recipient_type_and_recipient_id"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
  end

  create_table "appearances", force: :cascade do |t|
    t.string "image_background"
    t.string "theme_name"
    t.string "language"
    t.string "time_zone"
    t.string "admin_code", default: "admin"
    t.string "setting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setting_id"], name: "index_appearances_on_setting_id"
  end

  create_table "google_analytics_settings", force: :cascade do |t|
    t.string "ga_account_id"
    t.string "ga_tracking_id"
    t.boolean "ga_status"
    t.integer "setting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setting_id"], name: "index_google_analytics_settings_on_setting_id"
  end

  create_table "keppler_capsules_capsule_associations", force: :cascade do |t|
    t.string "association_type"
    t.string "capsule_name"
    t.boolean "dependention_destroy"
    t.integer "capsule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keppler_capsules_capsule_fields", force: :cascade do |t|
    t.string "name_field"
    t.string "format_field"
    t.integer "capsule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keppler_capsules_capsule_validations", force: :cascade do |t|
    t.integer "capsule_id"
    t.string "field"
    t.string "validation"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keppler_capsules_capsules", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_keppler_capsules_capsules_on_deleted_at"
  end

  create_table "keppler_frontend_themes", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.integer "position"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_keppler_frontend_themes_on_deleted_at"
  end

  create_table "keppler_languages_fields", force: :cascade do |t|
    t.string "key"
    t.text "value"
    t.integer "language_id"
    t.integer "position"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keppler_languages_languages", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.string "field_ids"
    t.integer "position"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meta_tags", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "meta_tags"
    t.string "url"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.jsonb "modules"
    t.bigint "role_id"
    t.string "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "scaffolds", force: :cascade do |t|
    t.string "name"
    t.string "fields"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scripts", force: :cascade do |t|
    t.string "name"
    t.text "script"
    t.string "url"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seos", force: :cascade do |t|
    t.integer "position"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_seos_on_deleted_at"
  end

  create_table "settings", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "phone"
    t.string "mobile"
    t.string "email"
    t.string "logo"
    t.string "favicon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smtp_settings", force: :cascade do |t|
    t.string "address"
    t.string "port"
    t.string "domain_name"
    t.string "email"
    t.string "password"
    t.integer "setting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setting_id"], name: "index_smtp_settings_on_setting_id"
  end

  create_table "social_accounts", force: :cascade do |t|
    t.string "facebook"
    t.string "twitter"
    t.string "instagram"
    t.string "google_plus"
    t.string "tripadvisor"
    t.string "pinterest"
    t.string "flickr"
    t.string "behance"
    t.string "dribbble"
    t.string "tumblr"
    t.string "github"
    t.string "linkedin"
    t.string "soundcloud"
    t.string "youtube"
    t.string "skype"
    t.string "vimeo"
    t.integer "setting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setting_id"], name: "index_social_accounts_on_setting_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "avatar"
    t.string "name"
    t.string "permalink"
    t.string "username"
    t.datetime "deleted_at"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["email"], name: "index_users_on_email", unique: true, where: "(deleted_at IS NULL)"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "permissions", "roles"
end
