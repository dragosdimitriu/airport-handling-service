class CreateServiceTypes < ActiveRecord::Migration
  def self.up
    create_table :service_types do |t|

              t.integer :flight_type_id
              t.integer :landing_unit_rate
              t.integer :landing_min_rate ,:default => 0
              t.integer :lighting_landing_unit_rate 
              t.integer :lighting_landing_min_rate,:default =>0
              t.integer :lighting_takeoff_unit_rate 
              t.integer :lighting_takeoff_min_rate, :default =>0
              t.integer :parking_unit_rate 
              t.integer :parking_min_rate,:default =>0
              t.integer :airport_dev_unit_rate
              t.integer :airport_dev_min_rate,:default =>0
              t.integer :passanger_serv_unit_rate
              t.integer :passanger_serv_min_rate,:default =>0
              t.integer :passanger_security_unit_rate
              t.integer  :passanger_security_min_rate,:default =>0
              t.integer :passanger_transfer_unit_rate
              t.integer :passanger_transfer_min_rate,:default =>0
              t.integer :basic_handle_unic_rate
              t.integer :basic_handling_2_7, :basic_handling_7_12, :basic_handling_12_17, :basic_handling_17_30, :basic_handling_30
              t.integer :on_request_checkin
              t.integer :on_request_GPU_28_5
              t.integer :on_request_GPU_115
              t.integer :on_request_air_starter
              t.integer :on_request_lavatory
              t.integer :on_request_water
              t.integer :on_request_bus_passanger
              t.integer :on_request_minibus_passanger
              t.integer :on_request_minibus_crew
              t.integer :on_request_cleaning_unit_rate
              t.integer :on_request_cleaning_40, :on_request_cleaning_40_100, :on_request_cleaning_100_150, :on_request_cleaning_150_200
    end
  end

  def self.down
    drop_table :service_types
  end
end
