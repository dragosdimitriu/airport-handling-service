# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 6) do

  create_table "flight_types", :force => true do |t|
    t.string "name"
    t.string "category"
  end

  create_table "service_requests", :force => true do |t|
    t.string   "airline"
    t.string   "a_c_type"
    t.string   "registration"
    t.decimal  "mtow",                         :precision => 10, :scale => 2
    t.string   "flight"
    t.integer  "passengers_arriving"
    t.integer  "passengers_departing"
    t.integer  "passengers_transit"
    t.integer  "cargo_arriving"
    t.integer  "cargo_departing"
    t.string   "route"
    t.datetime "landing"
    t.datetime "take_off"
    t.string   "remarks"
    t.integer  "number_of_seats"
    t.boolean  "checkin_req",                                                 :default => false
    t.boolean  "gpu_v_cc_req",                                                :default => false
    t.boolean  "gpu_115v_req",                                                :default => false
    t.boolean  "air_starter_req",                                             :default => false
    t.boolean  "lavatory_service_req",                                        :default => false
    t.boolean  "potable_water_req",                                           :default => false
    t.boolean  "tp_bus_pax_req",                                              :default => false
    t.boolean  "tp_minibus_pax_req",                                          :default => false
    t.boolean  "tp_minibus_crew_req",                                         :default => false
    t.boolean  "cleaning_services_req",                                       :default => false
    t.integer  "checkin_operations"
    t.integer  "gpu_v_cc_operations"
    t.integer  "gpu_115v_operations"
    t.integer  "air_starter_operations"
    t.integer  "lavatory_service_operations"
    t.integer  "potable_water_operations"
    t.integer  "tp_bus_pax_operations"
    t.integer  "tp_minibus_pax_operations"
    t.integer  "tp_minibus_crew_operations"
    t.integer  "cleaning_services_operations"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_types", :force => true do |t|
    t.integer "flight_type_id"
    t.integer "landing_unit_rate"
    t.integer "landing_min_rate",              :default => 0
    t.integer "lighting_landing_unit_rate"
    t.integer "lighting_landing_min_rate",     :default => 0
    t.integer "lighting_takeoff_unit_rate"
    t.integer "lighting_takeoff_min_rate",     :default => 0
    t.integer "parking_unit_rate"
    t.integer "parking_min_rate",              :default => 0
    t.integer "airport_dev_unit_rate"
    t.integer "airport_dev_min_rate",          :default => 0
    t.integer "passanger_serv_unit_rate"
    t.integer "passanger_serv_min_rate",       :default => 0
    t.integer "passanger_security_unit_rate"
    t.integer "passanger_security_min_rate",   :default => 0
    t.integer "passanger_transfer_unit_rate"
    t.integer "passanger_transfer_min_rate",   :default => 0
    t.integer "basic_handle_unic_rate"
    t.integer "basic_handling_2_7"
    t.integer "basic_handling_7_12"
    t.integer "basic_handling_12_17"
    t.integer "basic_handling_17_30"
    t.integer "basic_handling_30"
    t.integer "on_request_checkin"
    t.integer "on_request_GPU_28_5"
    t.integer "on_request_GPU_115"
    t.integer "on_request_air_starter"
    t.integer "on_request_lavatory"
    t.integer "on_request_water"
    t.integer "on_request_bus_passanger"
    t.integer "on_request_minibus_passanger"
    t.integer "on_request_minibus_crew"
    t.integer "on_request_cleaning_unit_rate"
    t.integer "on_request_cleaning_40"
    t.integer "on_request_cleaning_40_100"
    t.integer "on_request_cleaning_100_150"
    t.integer "on_request_cleaning_150_200"
  end

  add_index "service_types", ["flight_type_id"], :name => "fk_service_types_flight_types"

  create_table "users", :force => true do |t|
    t.string "name"
    t.string "username"
    t.string "password_salt"
    t.string "password_hash"
  end

end
