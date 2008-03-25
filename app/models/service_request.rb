class ServiceRequest < ActiveRecord::Base

	validates_presence_of :airline, :a_c_type, :mtow, :passengers_arriving, :passengers_departing, :landing , :take_off
	
	
 def validate
     
	if (gpu_v_cc_req == true)
		if gpu_v_cc_operations.nil? 
			errors.add(:gpu_v_cc_req, "Opertion should be greater than 0")
		else 
			if gpu_v_cc_operations <= 0
				errors.add(:gpu_v_cc_req, "Opertion should be a positive number")
			end
		end
		
	end
	
	if (gpu_115v_req == true)
		if gpu_115v_operations.nil? 
			errors.add(:gpu_115v_req, "Opertion should be greater than 0")
		else 
			if gpu_115v_operations <= 0
				errors.add(:gpu_115v_req, "Opertion should be a positive number")
			end
		end
		
	end
	
	
	if (air_starter_req == true)
		if air_starter_operations.nil? 
			errors.add(:air_starter_req, "Opertion should be greater than 0")
		else 
			if air_starter_operations <= 0
				errors.add(:air_starter_req, "Opertion should be a positive number")
			end
		end
		
	end
	
	if (lavatory_service_req == true)
		if lavatory_service_operations.nil? 
			errors.add(:lavatory_service_req, "Opertion should be greater than 0")
		else 
			if lavatory_service_operations <= 0
				errors.add(:lavatory_service_req, "Opertion should be a positive number")
			end
		end
		
	end
	
	if (potable_water_req == true)
		if potable_water_operations.nil? 
			errors.add(:potable_water_req, "Opertion should be greater than 0")
		else 
			if potable_water_operations <= 0
				errors.add(:potable_water_req, "Opertion should be a positive number")
			end
		end
		
	end
	
	if (tp_bus_pax_req == true)
		if tp_bus_pax_operations.nil? 
			errors.add(:tp_bus_pax_req, "Opertion should be greater than 0")
		else 
			if tp_bus_pax_operations <= 0
				errors.add(:tp_bus_pax_req, "Opertion should be a positive number")
			end
		end
		
	end
	
	if (tp_minibus_pax_req == true)
		if tp_minibus_pax_operations.nil? 
			errors.add(:tp_minibus_pax_req, "Opertion should be greater than 0")
		else 
			if tp_minibus_pax_operations <= 0
				errors.add(:tp_minibus_pax_req, "Opertion should be a positive number")
			end
		end
		
	end
	
	if (tp_minibus_crew_req == true)
		if tp_minibus_crew_operations.nil? 
			errors.add(:tp_minibus_crew_req, "Opertion should be greater than 0")
		else 
			if tp_minibus_crew_operations <= 0
				errors.add(:tp_minibus_crew_req, "Opertion should be a positive number")
			end
		end
		
	end
	
	if (cleaning_services_req == true)
		if cleaning_services_operations.nil? 
			errors.add(:cleaning_services_req, "Opertion should be greater than 0")
		else 
			if cleaning_services_operations <= 0
				errors.add(:cleaning_services_req, "Opertion should be a positive number")
			end
		end
		
	end

end  


	def hours_in_airport
		date1 = DateTime.parse(read_attribute("take_off").to_s)
		date2 = DateTime.parse(read_attribute("landing").to_s)


		time_until = date1 - date2
		hours,minutes,seconds,frac = DateTime.day_fraction_to_time(time_until)
		return  hours
		

	end
end
