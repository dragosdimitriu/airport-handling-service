class ServiceType < ActiveRecord::Base
  belongs_to :flight_type
  
  validates_presence_of :landing_unit_rate, :lighting_takeoff_unit_rate , :parking_unit_rate , :airport_dev_unit_rate, :passanger_serv_unit_rate, :passanger_security_unit_rate, :passanger_transfer_unit_rate, 
                        :basic_handle_unic_rate, :basic_handling_2_7, :basic_handling_7_12, :basic_handling_12_17, :basic_handling_17_30, :basic_handling_30,
                        :on_request_checkin, :on_request_GPU_28_5, :on_request_GPU_115, :on_request_air_starter,
                        :on_request_lavatory, :on_request_water, :on_request_bus_passanger, :on_request_minibus_passanger,
                        :on_request_minibus_crew, :on_request_cleaning_unit_rate,
                        :on_request_cleaning_40, :on_request_cleaning_40_100, :on_request_cleaning_100_150, :on_request_cleaning_150_200
end
