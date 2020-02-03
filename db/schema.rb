# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_15_082423) do

  create_table "QRTZ_BLOB_TRIGGERS", primary_key: ["SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "SCHED_NAME", limit: 120, null: false
    t.string "TRIGGER_NAME", limit: 200, null: false
    t.string "TRIGGER_GROUP", limit: 200, null: false
    t.binary "BLOB_DATA"
    t.index ["SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP"], name: "SCHED_NAME"
  end

  create_table "QRTZ_CALENDARS", primary_key: ["SCHED_NAME", "CALENDAR_NAME"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "SCHED_NAME", limit: 120, null: false
    t.string "CALENDAR_NAME", limit: 200, null: false
    t.binary "CALENDAR", null: false
  end

  create_table "QRTZ_CRON_TRIGGERS", primary_key: ["SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "SCHED_NAME", limit: 120, null: false
    t.string "TRIGGER_NAME", limit: 200, null: false
    t.string "TRIGGER_GROUP", limit: 200, null: false
    t.string "CRON_EXPRESSION", limit: 120, null: false
    t.string "TIME_ZONE_ID", limit: 80
  end

  create_table "QRTZ_FIRED_TRIGGERS", primary_key: ["SCHED_NAME", "ENTRY_ID"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "SCHED_NAME", limit: 120, null: false
    t.string "ENTRY_ID", limit: 140, null: false
    t.string "TRIGGER_NAME", limit: 200, null: false
    t.string "TRIGGER_GROUP", limit: 200, null: false
    t.string "INSTANCE_NAME", limit: 200, null: false
    t.bigint "FIRED_TIME", null: false
    t.bigint "SCHED_TIME", null: false
    t.integer "PRIORITY", null: false
    t.string "STATE", limit: 16, null: false
    t.string "JOB_NAME", limit: 200
    t.string "JOB_GROUP", limit: 200
    t.boolean "IS_NONCONCURRENT"
    t.boolean "REQUESTS_RECOVERY"
    t.index ["SCHED_NAME", "INSTANCE_NAME", "REQUESTS_RECOVERY"], name: "IDX_QRTZ_FT_INST_JOB_REQ_RCVRY"
    t.index ["SCHED_NAME", "INSTANCE_NAME"], name: "IDX_QRTZ_FT_TRIG_INST_NAME"
    t.index ["SCHED_NAME", "JOB_GROUP"], name: "IDX_QRTZ_FT_JG"
    t.index ["SCHED_NAME", "JOB_NAME", "JOB_GROUP"], name: "IDX_QRTZ_FT_J_G"
    t.index ["SCHED_NAME", "TRIGGER_GROUP"], name: "IDX_QRTZ_FT_TG"
    t.index ["SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP"], name: "IDX_QRTZ_FT_T_G"
  end

  create_table "QRTZ_JOB_DETAILS", primary_key: ["SCHED_NAME", "JOB_NAME", "JOB_GROUP"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "SCHED_NAME", limit: 120, null: false
    t.string "JOB_NAME", limit: 200, null: false
    t.string "JOB_GROUP", limit: 200, null: false
    t.string "DESCRIPTION", limit: 250
    t.string "JOB_CLASS_NAME", limit: 250, null: false
    t.boolean "IS_DURABLE", null: false
    t.boolean "IS_NONCONCURRENT", null: false
    t.boolean "IS_UPDATE_DATA", null: false
    t.boolean "REQUESTS_RECOVERY", null: false
    t.binary "JOB_DATA"
    t.index ["SCHED_NAME", "JOB_GROUP"], name: "IDX_QRTZ_J_GRP"
    t.index ["SCHED_NAME", "REQUESTS_RECOVERY"], name: "IDX_QRTZ_J_REQ_RECOVERY"
  end

  create_table "QRTZ_LOCKS", primary_key: ["SCHED_NAME", "LOCK_NAME"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "SCHED_NAME", limit: 120, null: false
    t.string "LOCK_NAME", limit: 40, null: false
  end

  create_table "QRTZ_PAUSED_TRIGGER_GRPS", primary_key: ["SCHED_NAME", "TRIGGER_GROUP"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "SCHED_NAME", limit: 120, null: false
    t.string "TRIGGER_GROUP", limit: 200, null: false
  end

  create_table "QRTZ_SCHEDULER_STATE", primary_key: ["SCHED_NAME", "INSTANCE_NAME"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "SCHED_NAME", limit: 120, null: false
    t.string "INSTANCE_NAME", limit: 200, null: false
    t.bigint "LAST_CHECKIN_TIME", null: false
    t.bigint "CHECKIN_INTERVAL", null: false
  end

  create_table "QRTZ_SIMPLE_TRIGGERS", primary_key: ["SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "SCHED_NAME", limit: 120, null: false
    t.string "TRIGGER_NAME", limit: 200, null: false
    t.string "TRIGGER_GROUP", limit: 200, null: false
    t.bigint "REPEAT_COUNT", null: false
    t.bigint "REPEAT_INTERVAL", null: false
    t.bigint "TIMES_TRIGGERED", null: false
  end

  create_table "QRTZ_SIMPROP_TRIGGERS", primary_key: ["SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "SCHED_NAME", limit: 120, null: false
    t.string "TRIGGER_NAME", limit: 200, null: false
    t.string "TRIGGER_GROUP", limit: 200, null: false
    t.string "STR_PROP_1", limit: 512
    t.string "STR_PROP_2", limit: 512
    t.string "STR_PROP_3", limit: 512
    t.integer "INT_PROP_1"
    t.integer "INT_PROP_2"
    t.bigint "LONG_PROP_1"
    t.bigint "LONG_PROP_2"
    t.decimal "DEC_PROP_1", precision: 13, scale: 4
    t.decimal "DEC_PROP_2", precision: 13, scale: 4
    t.boolean "BOOL_PROP_1"
    t.boolean "BOOL_PROP_2"
    t.string "TIME_ZONE_ID", limit: 80
  end

  create_table "QRTZ_TRIGGERS", primary_key: ["SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "SCHED_NAME", limit: 120, null: false
    t.string "TRIGGER_NAME", limit: 200, null: false
    t.string "TRIGGER_GROUP", limit: 200, null: false
    t.string "JOB_NAME", limit: 200, null: false
    t.string "JOB_GROUP", limit: 200, null: false
    t.string "DESCRIPTION", limit: 250
    t.bigint "NEXT_FIRE_TIME"
    t.bigint "PREV_FIRE_TIME"
    t.integer "PRIORITY"
    t.string "TRIGGER_STATE", limit: 16, null: false
    t.string "TRIGGER_TYPE", limit: 8, null: false
    t.bigint "START_TIME", null: false
    t.bigint "END_TIME"
    t.string "CALENDAR_NAME", limit: 200
    t.integer "MISFIRE_INSTR", limit: 2
    t.binary "JOB_DATA"
    t.index ["SCHED_NAME", "CALENDAR_NAME"], name: "IDX_QRTZ_T_C"
    t.index ["SCHED_NAME", "JOB_GROUP"], name: "IDX_QRTZ_T_JG"
    t.index ["SCHED_NAME", "JOB_NAME", "JOB_GROUP"], name: "IDX_QRTZ_T_J"
    t.index ["SCHED_NAME", "MISFIRE_INSTR", "NEXT_FIRE_TIME", "TRIGGER_GROUP", "TRIGGER_STATE"], name: "IDX_QRTZ_T_NFT_ST_MISFIRE_GRP"
    t.index ["SCHED_NAME", "MISFIRE_INSTR", "NEXT_FIRE_TIME", "TRIGGER_STATE"], name: "IDX_QRTZ_T_NFT_ST_MISFIRE"
    t.index ["SCHED_NAME", "MISFIRE_INSTR", "NEXT_FIRE_TIME"], name: "IDX_QRTZ_T_NFT_MISFIRE"
    t.index ["SCHED_NAME", "NEXT_FIRE_TIME"], name: "IDX_QRTZ_T_NEXT_FIRE_TIME"
    t.index ["SCHED_NAME", "TRIGGER_GROUP", "TRIGGER_STATE"], name: "IDX_QRTZ_T_N_G_STATE"
    t.index ["SCHED_NAME", "TRIGGER_GROUP"], name: "IDX_QRTZ_T_G"
    t.index ["SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP", "TRIGGER_STATE"], name: "IDX_QRTZ_T_N_STATE"
    t.index ["SCHED_NAME", "TRIGGER_STATE", "NEXT_FIRE_TIME"], name: "IDX_QRTZ_T_NFT_ST"
    t.index ["SCHED_NAME", "TRIGGER_STATE"], name: "IDX_QRTZ_T_STATE"
  end

  create_table "area", primary_key: "area_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", null: false, collation: "utf8_spanish_ci"
    t.string "description"
    t.integer "region_id", null: false
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["region_id"], name: "fk_area_region"
  end

  create_table "area_merchant", primary_key: "area_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 200
    t.integer "region_id"
    t.string "description", limit: 500
    t.string "created_date", limit: 45
    t.string "created_by", limit: 45
    t.string "updated_date", limit: 45
    t.string "updated_by", limit: 45
    t.string "image", limit: 45
    t.integer "order_by"
  end

  create_table "business_zone", primary_key: "business_zone_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "business zone", force: :cascade do |t|
    t.string "name", limit: 1000
    t.string "description", limit: 500
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
  end

  create_table "choose", primary_key: "choose_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "question_id"
    t.string "choose_content", limit: 500
  end

  create_table "claim", primary_key: "claim_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Claim", force: :cascade do |t|
    t.integer "claim_category_id"
    t.string "title", limit: 1500
    t.text "content", size: :long
    t.integer "user_id"
    t.string "full_name", limit: 500
    t.string "location", limit: 1500
    t.text "feedback", size: :long
    t.string "feedback_by", limit: 500
    t.datetime "feedback_date"
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["claim_category_id"], name: "fk_claim_category"
    t.index ["user_id"], name: "fk_claim_user"
  end

  create_table "claim_category", primary_key: "claim_category_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Claim Category", force: :cascade do |t|
    t.string "code", limit: 1500
    t.text "name", size: :long
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
  end

  create_table "department", primary_key: "department_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code", limit: 45
    t.string "name", limit: 50, null: false
    t.string "email"
    t.string "description"
    t.integer "hotline_display", default: 0, null: false
    t.integer "storage_display", default: 0, null: false
    t.integer "other_display", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.string "created_by", limit: 50
    t.datetime "created_date"
    t.string "updated_by", limit: 50
    t.datetime "updated_date"
    t.string "department_head"
  end

  create_table "document_file", primary_key: "document_file_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "file_name", limit: 250, null: false
    t.string "description", limit: 250
    t.string "file_extension", limit: 10
    t.string "file_path", limit: 500
    t.string "file_url", limit: 500
    t.datetime "version_date"
    t.string "version_number", limit: 10
    t.string "version_note", limit: 250
    t.integer "status", null: false
    t.integer "is_locked", null: false
    t.float "file_size", limit: 53, null: false
  end

  create_table "employee", primary_key: "employee_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", limit: 50, collation: "utf8mb4_general_ci"
    t.integer "department_id"
    t.string "position", limit: 50, collation: "utf8mb4_general_ci", comment: "Vị trí chức vụ"
    t.integer "status", comment: "Trạng thái 0: Tạm dừng 1: Hoạt động"
    t.datetime "created_date", precision: 6
    t.string "created_by", limit: 50, collation: "utf8mb4_general_ci"
    t.datetime "updated_date", precision: 6
    t.string "updated_by", limit: 50, collation: "utf8mb4_general_ci"
    t.index ["department_id"], name: "fk1_employee_idx"
  end

  create_table "event_check_in", primary_key: "event_check_in_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Event Check In", force: :cascade do |t|
    t.string "code", limit: 250
    t.datetime "check_in_date"
    t.integer "type", null: false
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
  end

  create_table "event_code", primary_key: "event_code_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Event Code", force: :cascade do |t|
    t.string "code", limit: 250
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
  end

  create_table "game_point", primary_key: "game_point_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Game Point", force: :cascade do |t|
    t.integer "user_id"
    t.string "mb_event", limit: 1500
    t.string "name", limit: 1000
    t.integer "point"
    t.integer "type"
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["user_id"], name: "fk_user_game_point"
  end

  create_table "group_permission", primary_key: "group_permission_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", limit: 500
    t.integer "position", default: 0
    t.string "created_by", limit: 50
    t.datetime "created_date"
    t.string "updated_by", limit: 50
    t.datetime "updated_date"
    t.string "code", limit: 245
  end

  create_table "jv_commit", primary_key: "commit_pk", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "author", limit: 200
    t.timestamp "commit_date", precision: 3, default: -> { "CURRENT_TIMESTAMP(3)" }, null: false
    t.string "commit_date_instant", limit: 30
    t.decimal "commit_id", precision: 22, scale: 2
    t.index ["commit_id"], name: "jv_commit_commit_id_idx"
  end

  create_table "jv_commit_property", primary_key: ["commit_fk", "property_name"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "property_name", limit: 191, null: false
    t.string "property_value", limit: 600
    t.bigint "commit_fk", null: false
    t.index ["commit_fk"], name: "jv_commit_property_commit_fk_idx"
    t.index ["property_name", "property_value"], name: "jv_commit_property_property_name_property_value_idx", length: { property_value: 191 }
  end

  create_table "jv_global_id", primary_key: "global_id_pk", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "local_id", limit: 191
    t.string "fragment", limit: 200
    t.string "type_name", limit: 200
    t.bigint "owner_id_fk"
    t.index ["local_id"], name: "jv_global_id_local_id_idx"
    t.index ["owner_id_fk"], name: "jv_global_id_owner_id_fk_idx"
  end

  create_table "jv_snapshot", primary_key: "snapshot_pk", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type", limit: 200
    t.bigint "version"
    t.text "state"
    t.text "changed_properties"
    t.string "managed_type", limit: 200
    t.bigint "global_id_fk"
    t.bigint "commit_fk"
    t.index ["commit_fk"], name: "jv_snapshot_commit_fk_idx"
    t.index ["global_id_fk"], name: "jv_snapshot_global_id_fk_idx"
  end

  create_table "mail_message", primary_key: "mail_message_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "sender", limit: 100
    t.string "receiver", limit: 100
    t.string "subject", limit: 1000
    t.text "body"
    t.datetime "sent_time"
    t.integer "tried_time"
    t.integer "status", default: 0
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["mail_message_id"], name: "mail_message_id_UNIQUE", unique: true
  end

  create_table "mb_bus_car", primary_key: "mb_bus_car_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "mb_bus_car", force: :cascade do |t|
    t.integer "mb_bus_route_id"
    t.string "car_number", limit: 250
    t.string "devid"
    t.string "description", limit: 250
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["mb_bus_route_id"], name: "fk_bus_car_route"
  end

  create_table "mb_bus_location", primary_key: "mb_bus_location_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "mb_bus_location", force: :cascade do |t|
    t.string "code", limit: 15
    t.string "name", limit: 250
    t.integer "type", default: 0, null: false
    t.decimal "latitude", precision: 15, scale: 10
    t.decimal "longitude", precision: 15, scale: 10
    t.integer "is_start"
    t.integer "is_end"
    t.text "extra_point", size: :long
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
  end

  create_table "mb_bus_lot", primary_key: "mb_bus_lot_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "mb_bus_lot", force: :cascade do |t|
    t.integer "mb_bus_route_id"
    t.integer "mb_bus_car_id"
    t.string "start_time", limit: 250
    t.string "end_time", limit: 250
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["mb_bus_car_id"], name: "fk_bus_lot_car"
    t.index ["mb_bus_route_id"], name: "fk_bus_lot_route"
  end

  create_table "mb_bus_points", primary_key: "mb_bus_points_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "mb_bus_points", force: :cascade do |t|
    t.integer "mb_bus_route_id"
    t.string "date", limit: 250
    t.string "lat_lng", limit: 500
    t.text "address", size: :long
    t.string "description", limit: 500
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["mb_bus_route_id"], name: "fk_bus_points_route"
  end

  create_table "mb_bus_route", primary_key: "mb_bus_route_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "mb_bus_route", force: :cascade do |t|
    t.string "name", limit: 250
    t.string "description", limit: 500
    t.integer "start_location"
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
  end

  create_table "mb_bus_schedule", primary_key: "mb_bus_schedule_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "mb_bus_schedule", force: :cascade do |t|
    t.integer "mb_bus_route_id"
    t.integer "mb_bus_location_id"
    t.integer "mb_bus_trip_id"
    t.string "time", limit: 250
    t.integer "order_no"
    t.string "description", limit: 250
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["mb_bus_location_id"], name: "fk_mb_bus_location"
    t.index ["mb_bus_route_id"], name: "fk_mb_bus_route"
    t.index ["mb_bus_trip_id"], name: "fk_mb_bus_trip"
  end

  create_table "mb_bus_trip", primary_key: "mb_bus_trip_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "mb_bus_trip", force: :cascade do |t|
    t.integer "order_no"
    t.string "description", limit: 250
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
  end

  create_table "mb_data", primary_key: "mb_data_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "data", force: :cascade do |t|
    t.integer "user_id"
    t.text "data", size: :long
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["user_id"], name: "fk_data_user"
  end

  create_table "mb_discovery_category", primary_key: "mb_discovery_category_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "mb_discovery_category", force: :cascade do |t|
    t.string "code", limit: 250
    t.string "name", limit: 250
    t.string "image", limit: 500
    t.string "description", limit: 500
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["code"], name: "uk_mb_discovery_category", unique: true
  end

  create_table "mb_discovery_category_detail", primary_key: "mb_discovery_category_detail_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", limit: 500, null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "phone", limit: 20
    t.string "image", limit: 500
    t.string "description"
    t.integer "mb_discovery_category_id", null: false
    t.string "group_type", limit: 150
    t.integer "is_hot"
    t.integer "is_accept_voucher"
    t.integer "business_zone_id"
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["business_zone_id"], name: "fk_dcd_bz"
    t.index ["mb_discovery_category_id"], name: "fk_mb_discovery_category"
  end

  create_table "mb_event", primary_key: "mb_event_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "title", limit: 500
    t.string "name", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "location", limit: 500, null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "image", limit: 500
    t.string "short_description", limit: 1000
    t.text "description", size: :long
    t.string "url"
    t.integer "is_game", default: 0, null: false
    t.text "guide", size: :long
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
  end

  create_table "mb_item", primary_key: "item_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "item_category_id", limit: 200, null: false
    t.string "name", limit: 200, null: false
    t.float "price"
    t.boolean "isbestseller"
    t.boolean "ispopular"
    t.string "image", limit: 200, null: false
    t.integer "mb_merchant_id", null: false
    t.boolean "is_deleted", default: false
  end

  create_table "mb_item_category", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "item_name", limit: 200, null: false
    t.string "image", limit: 200
    t.boolean "is_deleted", default: false, null: false
  end

  create_table "mb_map_region", primary_key: "mb_map_region_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code", limit: 20, null: false, collation: "utf8_spanish_ci"
    t.string "name", null: false, collation: "utf8_spanish_ci"
    t.string "description"
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
  end

  create_table "mb_merchant", primary_key: "mb_merchant_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", limit: 500, null: false
    t.string "latitude", limit: 200
    t.string "longitude", limit: 200
    t.string "phone", limit: 20
    t.string "image", limit: 500
    t.string "description", limit: 1000
    t.string "mb_category_id", limit: 200, null: false
    t.boolean "delivery"
    t.string "time_start", default: "07:00"
    t.string "time_end", default: "11:00"
    t.string "facebook", limit: 500, default: "https://www.facebook.com/highlandscoffeevietnam/"
    t.integer "area_id", default: 4
    t.text "json"
    t.string "group_type", limit: 150
    t.integer "is_hot", default: 0
    t.integer "is_accept_voucher", default: 0
    t.integer "business_zone_id", default: 4
    t.integer "user_id"
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.boolean "is_deleted", default: false, null: false
    t.string "hashtag", limit: 500
    t.string "hashtag_unicode", limit: 500
    t.string "instagram", limit: 500
    t.string "website", limit: 500
    t.string "merchant_code", limit: 200
    t.integer "is_approvate", default: 0
    t.index ["name"], name: "idx_fulltext", type: :fulltext
    t.index ["name"], name: "idx_mb_merchant_name", type: :fulltext
    t.index ["name"], name: "name", type: :fulltext
  end

  create_table "mb_merchant_category", primary_key: "mb_category_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 200, collation: "latin1_swedish_ci"
    t.string "code", limit: 200, collation: "latin1_swedish_ci"
    t.string "description", limit: 500, collation: "latin1_swedish_ci"
    t.string "image", limit: 500, collation: "latin1_swedish_ci"
    t.datetime "created_date"
    t.string "created_by", limit: 50, collation: "latin1_swedish_ci"
    t.integer "order_by"
    t.datetime "updated_date"
    t.string "updated_by", limit: 50, collation: "latin1_swedish_ci"
  end

  create_table "mb_merchant_image", primary_key: "Id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "mb_merchant_id", null: false
    t.text "image", null: false
  end

  create_table "mb_merchant_of_day", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "merchant_id"
    t.string "image", limit: 500
    t.date "from_date"
    t.date "to_date"
    t.string "titles", limit: 500
    t.integer "is_merchant", limit: 1
  end

  create_table "mb_news", primary_key: "mb_news_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "title", limit: 1000, null: false
    t.text "short_des", size: :long
    t.text "full_des", size: :long
    t.string "image", limit: 1500
    t.integer "is_hot_news"
    t.integer "mb_news_category_id"
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["mb_news_category_id"], name: "fk_mb_news_category"
  end

  create_table "mb_news_category", primary_key: "mb_news_category_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "mb_news_category", force: :cascade do |t|
    t.string "code", limit: 250
    t.string "name", limit: 250
    t.string "image", limit: 1500
    t.string "description", limit: 500
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["code"], name: "uk_mb_news_category", unique: true
  end

  create_table "mb_notification", primary_key: "mb_notification_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Bảng lưu trữ chi tiết thông báo gửi đi cho người dùng", force: :cascade do |t|
    t.string "title", limit: 1000, null: false
    t.string "body", limit: 2000, null: false
    t.string "link"
    t.integer "is_read", default: 0, null: false
    t.integer "user_id"
    t.integer "mb_notification_broadcast_id"
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.string "message_link"
    t.index ["mb_notification_broadcast_id"], name: "mb_notification_fk_broadcast_idx"
    t.index ["mb_notification_id"], name: "notification_id_UNIQUE", unique: true
    t.index ["user_id"], name: "mb_notification_fk_user_idx"
  end

  create_table "mb_notification_broadcast", primary_key: "mb_notification_broadcast_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Bảng lưu trữ dữ liệu về quảng bá thông báo", force: :cascade do |t|
    t.integer "send_owner", default: 0, null: false
    t.datetime "start_time"
    t.integer "status", default: 0, null: false
    t.integer "mb_notification_content_id", null: false
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.string "title", limit: 1000
    t.string "sub_description", limit: 1000
    t.string "description", limit: 3000
    t.string "job_name", limit: 100
    t.string "message_link"
    t.integer "send_all", default: 0, null: false
    t.index ["job_name"], name: "job_name_UNIQUE", unique: true
    t.index ["mb_notification_broadcast_id"], name: "mb_notification_broadcast_id_UNIQUE", unique: true
  end

  create_table "mb_notification_broadcast_filter", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Bảng trung gian lưu truwxd thông tin bộ lọc", force: :cascade do |t|
    t.integer "mb_notification_broadcast_id"
    t.integer "location_id"
    t.integer "zone_id"
    t.integer "area_id"
    t.integer "region_id"
    t.index ["area_id"], name: "mb_notification_broadcast_filter_fk_area_idx"
    t.index ["location_id"], name: "mb_notification_broadcast_filter_fk_location_idx"
    t.index ["mb_notification_broadcast_id"], name: "mb_notification_broadcast_filter_fk_mb_notification_broadca_idx"
    t.index ["region_id"], name: "mb_notification_broadcast_filter_fk_region_idx"
    t.index ["zone_id"], name: "mb_notification_broadcast_filter_fk_zone_idx"
  end

  create_table "mb_notification_content", primary_key: "mb_notification_content_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Bảng lưu thông tin nội dung thông báo", force: :cascade do |t|
    t.string "title", limit: 1000, null: false
    t.string "sub_description", limit: 1000
    t.string "description", limit: 3000
    t.string "created_date", limit: 45
    t.string "created_by", limit: 50
    t.string "updated_date", limit: 45
    t.string "updated_by", limit: 50
    t.integer "status", default: 1
    t.index ["mb_notification_content_id"], name: "mb_notification_content_id_UNIQUE", unique: true
  end

  create_table "mb_user", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "FullName", limit: 100
    t.string "UserName", limit: 100
    t.string "PassWord", limit: 100
    t.integer "RoleId"
    t.string "Address", limit: 200
    t.string "PhoneNumber", limit: 20
    t.string "Email", limit: 100
    t.string "FaceBook", limit: 200
    t.string "Avatar", limit: 500
    t.string "Notes", limit: 500
    t.datetime "CreatedDate"
    t.datetime "ModifiedDate"
    t.integer "Status"
    t.string "ActiveCode", limit: 100
    t.string "VaiTro", limit: 500
  end

  create_table "menu_item", primary_key: "menu_item_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", null: false
    t.string "icon"
    t.string "url", limit: 45
    t.integer "parent_id"
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.integer "position", default: 0
  end

  create_table "oauth_access_token", primary_key: "authentication_id", id: :string, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "token_id"
    t.binary "token", size: :medium
    t.string "user_name"
    t.string "client_id"
    t.binary "authentication", size: :medium
    t.string "refresh_token"
    t.index ["authentication_id"], name: "idx_oauth_access_token_authentication_id"
    t.index ["refresh_token"], name: "idx_oauth_access_token_refresh_token"
    t.index ["token_id"], name: "idx_oauth_access_token_token_id"
    t.index ["user_name"], name: "idx_oauth_access_token_user_name"
  end

  create_table "oauth_client_details", primary_key: "client_id", id: :string, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "resource_ids"
    t.string "client_secret"
    t.string "scope"
    t.string "authorized_grant_types"
    t.string "web_server_redirect_uri"
    t.string "authorities"
    t.integer "access_token_validity"
    t.integer "refresh_token_validity"
    t.string "additional_information", limit: 4096
    t.string "autoapprove"
  end

  create_table "oauth_client_token", primary_key: "authentication_id", id: :string, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "token_id"
    t.binary "token", size: :medium
    t.string "user_name"
    t.string "client_id"
  end

  create_table "oauth_code", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code"
    t.binary "authentication", size: :medium
  end

  create_table "oauth_refresh_token", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "token_id"
    t.binary "token", size: :medium
    t.binary "authentication", size: :medium
    t.index ["token_id"], name: "idx_oauth_oauth_refresh_token_id"
  end

  create_table "permission", primary_key: "permission_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "code", limit: 500
    t.string "bms_code", limit: 250
    t.string "uri", limit: 500
    t.string "name", limit: 500
    t.string "description", limit: 500
    t.string "method", limit: 50
    t.integer "position", default: 0
    t.integer "skip"
    t.integer "group_permission_id"
    t.string "created_by", limit: 50
    t.datetime "created_date"
    t.string "updated_by", limit: 50
    t.datetime "updated_date"
    t.index ["group_permission_id"], name: "FK_Permission_Group_Permission_idx"
  end

  create_table "question", primary_key: "question_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "question_type"
    t.string "contents", limit: 500
    t.integer "orders"
  end

  create_table "region", primary_key: "region_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", null: false, collation: "utf8_spanish_ci"
    t.string "description"
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
  end

  create_table "sub_business_type", primary_key: "sub_business_type_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "Lưu trữ thông tin ngành nghề con", force: :cascade do |t|
    t.string "name", limit: 500, null: false
    t.integer "business_type_id", null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_date"
    t.string "created_by", limit: 45
    t.datetime "updated_date"
    t.string "updated_by", limit: 45
    t.index ["business_type_id"], name: "fk_sub_business_type_idx"
  end

  create_table "survey", primary_key: "survey_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "title", limit: 200, collation: "utf8_general_ci"
    t.string "description", limit: 500, collation: "utf8_general_ci"
    t.string "image", limit: 500, collation: "utf8_general_ci"
    t.datetime "from_date"
    t.datetime "to_date"
    t.integer "status"
    t.string "created_by", limit: 200
    t.datetime "created_date"
    t.string "updated_by", limit: 200
    t.datetime "updated_date"
  end

  create_table "test", primary_key: "test_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "test_date", null: false
    t.datetime "test_date_time", null: false
  end

  create_table "user", primary_key: "user_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "profile_id"
    t.string "username", limit: 50, null: false
    t.string "password", limit: 300, null: false
    t.string "avatar", limit: 500
    t.string "description"
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.integer "status", default: 1
    t.string "first_name", limit: 100
    t.string "last_name", limit: 100
    t.string "full_name", limit: 100
    t.string "email", limit: 200
    t.integer "user_role_id"
    t.string "address"
    t.date "dob"
    t.integer "gender"
    t.string "main_screen", limit: 45
    t.string "phone_number", limit: 45
    t.integer "position_id"
    t.string "device_token"
    t.string "web_token"
    t.integer "employee_id"
    t.string "reset_password_token", limit: 500
    t.integer "reset_status"
    t.datetime "reset_password_expire"
    t.string "register_token", limit: 500
    t.integer "register_status"
    t.integer "login_attempts", default: 0
    t.string "lock_reason"
    t.datetime "lock_expired"
    t.string "password_digest"
    t.index ["employee_id"], name: "fk_user_employee_idx"
    t.index ["position_id"], name: "fk_user_position_idx"
    t.index ["profile_id"], name: "fk_user_profile_idx"
    t.index ["user_role_id"], name: "fk_user_role"
    t.index ["username"], name: "uk_user_username", unique: true
  end

  create_table "user_area", primary_key: ["user_id", "area_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "area_id", null: false
    t.index ["area_id"], name: "fk_user_area_idx"
  end

  create_table "user_department", primary_key: ["user_id", "department_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "department_id", null: false
    t.index ["department_id"], name: "fk_user_department_idx"
  end

  create_table "user_group_permission", primary_key: ["user_id", "group_permission_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_permission_id", null: false
    t.index ["group_permission_id"], name: "fk_user_group_permission_idx"
  end

  create_table "user_permission", primary_key: ["user_id", "permission_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "fk_user_permission_idx"
  end

  create_table "user_role", primary_key: "user_role_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", limit: 500
    t.string "description", limit: 500
    t.string "created_by", limit: 50
    t.datetime "created_date"
    t.string "updated_by", limit: 50
    t.datetime "updated_date"
    t.boolean "active", default: true
  end

  create_table "user_role_group_permission", primary_key: ["user_role_id", "group_permission_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_role_id", null: false
    t.integer "group_permission_id", null: false
    t.index ["group_permission_id"], name: "fk_role_group_permission_idx"
  end

  create_table "user_role_menu_item", primary_key: ["user_role_id", "menu_item_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_role_id", null: false
    t.integer "menu_item_id", null: false
    t.index ["menu_item_id"], name: "fk_user_role_menu_item_idx"
  end

  create_table "user_role_permission", primary_key: ["user_role_id", "permission_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_role_id", null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "fk_role_permission_idx"
  end

  create_table "user_selection", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "choose_id", null: false
    t.string "device_id", limit: 100
    t.datetime "created_date"
    t.integer "survey_id", null: false
  end

  create_table "user_zone", primary_key: ["user_id", "zone_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "zone_id", null: false
    t.index ["zone_id"], name: "fk_user_zone_idx"
  end

  create_table "voucher", primary_key: "voucher_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Voucher", force: :cascade do |t|
    t.integer "user_id"
    t.string "serial", limit: 1000
    t.datetime "from_date"
    t.datetime "to_date"
    t.integer "amount"
    t.integer "status"
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["user_id"], name: "fk_user_voucher"
  end

  create_table "zone", primary_key: "zone_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "name", limit: 45, collation: "utf8_spanish_ci"
    t.string "address"
    t.string "description"
    t.integer "area_id", null: false
    t.datetime "created_date"
    t.string "created_by", limit: 50
    t.datetime "updated_date"
    t.string "updated_by", limit: 50
    t.index ["area_id"], name: "fk_building_building_group"
  end

  add_foreign_key "QRTZ_BLOB_TRIGGERS", "QRTZ_TRIGGERS", column: "SCHED_NAME", primary_key: "SCHED_NAME", name: "QRTZ_BLOB_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_BLOB_TRIGGERS", "QRTZ_TRIGGERS", column: "TRIGGER_GROUP", primary_key: "TRIGGER_GROUP", name: "QRTZ_BLOB_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_BLOB_TRIGGERS", "QRTZ_TRIGGERS", column: "TRIGGER_NAME", primary_key: "TRIGGER_NAME", name: "QRTZ_BLOB_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_CRON_TRIGGERS", "QRTZ_TRIGGERS", column: "SCHED_NAME", primary_key: "SCHED_NAME", name: "QRTZ_CRON_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_CRON_TRIGGERS", "QRTZ_TRIGGERS", column: "TRIGGER_GROUP", primary_key: "TRIGGER_GROUP", name: "QRTZ_CRON_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_CRON_TRIGGERS", "QRTZ_TRIGGERS", column: "TRIGGER_NAME", primary_key: "TRIGGER_NAME", name: "QRTZ_CRON_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_SIMPLE_TRIGGERS", "QRTZ_TRIGGERS", column: "SCHED_NAME", primary_key: "SCHED_NAME", name: "QRTZ_SIMPLE_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_SIMPLE_TRIGGERS", "QRTZ_TRIGGERS", column: "TRIGGER_GROUP", primary_key: "TRIGGER_GROUP", name: "QRTZ_SIMPLE_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_SIMPLE_TRIGGERS", "QRTZ_TRIGGERS", column: "TRIGGER_NAME", primary_key: "TRIGGER_NAME", name: "QRTZ_SIMPLE_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_SIMPROP_TRIGGERS", "QRTZ_TRIGGERS", column: "SCHED_NAME", primary_key: "SCHED_NAME", name: "QRTZ_SIMPROP_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_SIMPROP_TRIGGERS", "QRTZ_TRIGGERS", column: "TRIGGER_GROUP", primary_key: "TRIGGER_GROUP", name: "QRTZ_SIMPROP_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_SIMPROP_TRIGGERS", "QRTZ_TRIGGERS", column: "TRIGGER_NAME", primary_key: "TRIGGER_NAME", name: "QRTZ_SIMPROP_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_TRIGGERS", "QRTZ_JOB_DETAILS", column: "JOB_GROUP", primary_key: "JOB_GROUP", name: "QRTZ_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_TRIGGERS", "QRTZ_JOB_DETAILS", column: "JOB_NAME", primary_key: "JOB_NAME", name: "QRTZ_TRIGGERS_ibfk_1"
  add_foreign_key "QRTZ_TRIGGERS", "QRTZ_JOB_DETAILS", column: "SCHED_NAME", primary_key: "SCHED_NAME", name: "QRTZ_TRIGGERS_ibfk_1"
  add_foreign_key "area", "region", primary_key: "region_id", name: "fk_area_region"
  add_foreign_key "claim", "claim_category", primary_key: "claim_category_id", name: "fk_claim_category"
  add_foreign_key "claim", "user", primary_key: "user_id", name: "fk_claim_user"
  add_foreign_key "employee", "department", primary_key: "department_id", name: "fk1_employee_idx"
  add_foreign_key "game_point", "user", primary_key: "user_id", name: "fk_user_game_point"
  add_foreign_key "jv_commit_property", "jv_commit", column: "commit_fk", primary_key: "commit_pk", name: "jv_commit_property_commit_fk"
  add_foreign_key "jv_global_id", "jv_global_id", column: "owner_id_fk", primary_key: "global_id_pk", name: "jv_global_id_owner_id_fk"
  add_foreign_key "jv_snapshot", "jv_commit", column: "commit_fk", primary_key: "commit_pk", name: "jv_snapshot_commit_fk"
  add_foreign_key "jv_snapshot", "jv_global_id", column: "global_id_fk", primary_key: "global_id_pk", name: "jv_snapshot_global_id_fk"
  add_foreign_key "mb_bus_car", "mb_bus_route", primary_key: "mb_bus_route_id", name: "fk_bus_car_route"
  add_foreign_key "mb_bus_lot", "mb_bus_car", primary_key: "mb_bus_car_id", name: "fk_bus_lot_car"
  add_foreign_key "mb_bus_lot", "mb_bus_route", primary_key: "mb_bus_route_id", name: "fk_bus_lot_route"
  add_foreign_key "mb_bus_points", "mb_bus_route", primary_key: "mb_bus_route_id", name: "fk_bus_points_route"
  add_foreign_key "mb_bus_schedule", "mb_bus_location", primary_key: "mb_bus_location_id", name: "fk_mb_bus_location"
  add_foreign_key "mb_bus_schedule", "mb_bus_route", primary_key: "mb_bus_route_id", name: "fk_mb_bus_route"
  add_foreign_key "mb_bus_schedule", "mb_bus_trip", primary_key: "mb_bus_trip_id", name: "fk_mb_bus_trip"
  add_foreign_key "mb_data", "user", primary_key: "user_id", name: "fk_data_user"
  add_foreign_key "mb_discovery_category_detail", "business_zone", primary_key: "business_zone_id", name: "fk_dcd_bz"
  add_foreign_key "mb_discovery_category_detail", "mb_discovery_category", primary_key: "mb_discovery_category_id", name: "fk_mb_discovery_category"
  add_foreign_key "mb_news", "mb_news_category", primary_key: "mb_news_category_id", name: "fk_mb_news_category"
  add_foreign_key "mb_notification", "mb_notification_broadcast", primary_key: "mb_notification_broadcast_id", name: "mb_notification_fk_broadcast"
  add_foreign_key "mb_notification", "user", primary_key: "user_id", name: "mb_notification_fk_user"
  add_foreign_key "mb_notification_broadcast_filter", "area", primary_key: "area_id", name: "mb_notification_broadcast_filter_fk_area"
  add_foreign_key "mb_notification_broadcast_filter", "location", primary_key: "location_id", name: "mb_notification_broadcast_filter_fk_location"
  add_foreign_key "mb_notification_broadcast_filter", "mb_notification_broadcast", primary_key: "mb_notification_broadcast_id", name: "mb_notification_broadcast_filter_fk_mb_notification_broadcast"
  add_foreign_key "mb_notification_broadcast_filter", "region", primary_key: "region_id", name: "mb_notification_broadcast_filter_fk_region"
  add_foreign_key "mb_notification_broadcast_filter", "zone", primary_key: "zone_id", name: "mb_notification_broadcast_filter_fk_zone"
  add_foreign_key "permission", "group_permission", primary_key: "group_permission_id", name: "permission_ibfk_1"
  add_foreign_key "user", "employee", primary_key: "employee_id", name: "fk_user_employee"
  add_foreign_key "user", "position", primary_key: "position_id", name: "fk_user_position"
  add_foreign_key "user", "user_role", primary_key: "user_role_id", name: "fk_user_role"
  add_foreign_key "user_area", "area", primary_key: "area_id", name: "user_area_ibfk_1"
  add_foreign_key "user_department", "department", primary_key: "department_id", name: "user_department_ibfk_1"
  add_foreign_key "user_group_permission", "group_permission", primary_key: "group_permission_id", name: "user_group_permission_ibfk_1"
  add_foreign_key "user_permission", "permission", primary_key: "permission_id", name: "user_permission_ibfk_1"
  add_foreign_key "user_role_group_permission", "group_permission", primary_key: "group_permission_id", name: "user_role_group_permission_ibfk_1"
  add_foreign_key "user_role_menu_item", "menu_item", primary_key: "menu_item_id", name: "fk_user_role_menu_item"
  add_foreign_key "user_role_permission", "permission", primary_key: "permission_id", name: "user_role_permission_ibfk_1"
  add_foreign_key "user_zone", "zone", primary_key: "zone_id", name: "user_zone_ibfk_1"
  add_foreign_key "voucher", "user", primary_key: "user_id", name: "fk_user_voucher"
  add_foreign_key "zone", "area", primary_key: "area_id", name: "fk_zone_area"
end
