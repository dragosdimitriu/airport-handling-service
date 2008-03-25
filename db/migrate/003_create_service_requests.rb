class CreateServiceRequests < ActiveRecord::Migration
  def self.up
    create_table :service_requests do |t|
      t.string :airline
      t.string :a_c_type
      t.string :registration
      t.column :mtow, :decimal, :precision =>10, :scale => 2
      t.string :flight
      t.integer :passengers_arriving
      t.integer :passengers_departing
      t.integer :passengers_transit
      t.integer :cargo_arriving
      t.integer :cargo_departing
      t.string :route
      t.datetime :landing
      t.datetime :take_off
      t.string :remarks
	  t.integer :number_of_seats
	  t.boolean  :checkin_req, :default => false
	  t.boolean :gpu_v_cc_req, :default => false
	  t.boolean :gpu_115v_req, :default => false 
	  t.boolean  :air_starter_req , :default => false
	  t.boolean  :lavatory_service_req, :default => false 
	  t.boolean  :potable_water_req, :default => false
	  t.boolean  :tp_bus_pax_req, :default => false 
	  t.boolean  :tp_minibus_pax_req , :default => false
	  t.boolean :tp_minibus_crew_req, :default => false 
	  t.boolean :cleaning_services_req, :default => false 
	  t.integer :checkin_operations
	  t.integer :gpu_v_cc_operations
	  t.integer :gpu_115v_operations
	  t.integer  :air_starter_operations
	  t.integer  :lavatory_service_operations
	  t.integer  :potable_water_operations
	  t.integer  :tp_bus_pax_operations
	  t.integer  :tp_minibus_pax_operations
	  t.integer :tp_minibus_crew_operations
	  t.integer :cleaning_services_operations
	  

      t.timestamps
    end
  end

  def self.down
    drop_table :service_requests
  end
end
