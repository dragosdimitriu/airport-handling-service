module ServiceRequestsHelper
  
  def total_international_flights(start_date, stop_date)
    
    #get all international flights
    flights = 0 #number of flights
    passangers_arr = 0 #number of arriving passangers
    passangers_dep = 0 #number of departing passangers
    passangers_transit = 0 #number of transfer passangers
    cargo_arr = 0 #tons of cargo arriving
    cargo_dep = 0 #tons of cargo departing 
    
	  @flight_type_international = ServiceRequest.find(:all, :conditions => ["landing BETWEEN ? and ?",  start_date, stop_date])
	  @flight_type_international.each { |flight_type_international|
	    flight_type = FlightType.find_by_id(flight_type_international.a_c_type)
	    if flight_type.category == "International"
	      flights += 1
        passangers_arr += flight_type_international.passengers_arriving
        passangers_dep += flight_type_international.passengers_departing
        passangers_transit += flight_type_international.passengers_transit
        cargo_arr += flight_type_international.cargo_arriving
        cargo_dep += flight_type_international.cargo_departing
      end
	  }
	  return flights,passangers_arr,passangers_dep,passangers_transit,cargo_arr,cargo_dep
	end

	def total_domestic_flights(start_date, stop_date)
    #get all domestic flights
    flights = 0 #number of flights
    passangers_arr = 0 #number of arriving passangers
    passangers_dep = 0 #number of departing passangers
    passangers_transit = 0 #number of transfer passangers
    cargo_arr = 0 #tons of cargo arriving
    cargo_dep = 0 #tons of cargo departing 
    
	  @flight_type_domestic = ServiceRequest.find(:all, :conditions => ["landing BETWEEN ? and ?",  start_date, stop_date])
	  @flight_type_domestic.each { |flight_type_domestic|
	    flight_type = FlightType.find_by_id(flight_type_domestic.a_c_type)
	    if flight_type.category == "Domestic"
	      flights += 1
        passangers_arr += flight_type_domestic.passengers_arriving
        passangers_dep += flight_type_domestic.passengers_departing
        passangers_transit += flight_type_domestic.passengers_transit
        cargo_arr += flight_type_domestic.cargo_arriving
        cargo_dep += flight_type_domestic.cargo_departing
      end
	  }
	  return flights,passangers_arr,passangers_dep,passangers_transit,cargo_arr,cargo_dep
	end
	def getLandingPrice(service_request)
		price = @preturi.landing_unit_rate * @service_request.mtow
		if (price >@preturi.landing_min_rate )
			return price
		else
			return @preturi.landing_min_rate
		end
	end
	
	def getLightingPrice(service_request)
		price = @preturi.lighting_landing_unit_rate * @service_request.mtow 
		if (price >@preturi.lighting_landing_min_rate )
			return price
		else
			return @preturi.lighting_landing_min_rate
		end
	end

	 
	
	def getParkingPrice(service_request)
		price = @preturi.parking_unit_rate * @service_request.mtow * @service_request.hours_in_airport
		if (price > @preturi.parking_min_rate )
			return price
		else
			return @preturi.parking_min_rate
		end
	end
	
	
	def getAirportPrice(service_request)
		total_pasagers = (@service_request.passengers_arriving + @service_request.passengers_departing)
		price = @preturi.airport_dev_unit_rate * total_pasagers
		if (price > @preturi.airport_dev_min_rate )
			return price
		else
			return @preturi.airport_dev_min_rate
		end
	end
	
	def getPassengerService(service_request)
		total_pasagers = (@service_request.passengers_arriving + @service_request.passengers_departing)
		price = @preturi.passanger_serv_unit_rate * total_pasagers
		if (price > @preturi.passanger_serv_min_rate )
			return price
		else
			return @preturi.passanger_serv_min_rate
		end
	end
	
	
	
	def getPassengerSecurity(service_request)
		total_pasagers = (@service_request.passengers_arriving + @service_request.passengers_departing)
		price = @preturi.passanger_security_unit_rate * total_pasagers
		if (price > @preturi.passanger_security_min_rate )
			return price
		else
			return @preturi.passanger_security_min_rate
		end
	end
	
	def getPassengerTranzit(service_request) 
		total_pasagers = @service_request.passengers_transit
		price = @preturi.passanger_transfer_unit_rate * total_pasagers
		if (price > @preturi.passanger_transfer_min_rate )
			return price
		else
			return @preturi.passanger_transfer_min_rate
		end
	end
	
	def getBasicHandling(service_request)
		if (@preturi.basic_handle_unic_rate != 0)
			return @preturi.basic_handle_unic_rate
		end
		
		if (@service_request.mtow <= 7)
			return @preturi.basic_handling_2_7
		end
		
		if (@service_request.mtow <= 12)
			return @preturi.basic_handling_7_12
		end
	
		if (@service_request.mtow <= 17)
			return @preturi.basic_handling_12_17
		end
		
		if (@service_request.mtow <= 30)
			return @preturi.basic_handling_17_30
		else
			return @preturi.basic_handling_30
		end		
	end
	
	
	def getCheckInTax(service_request)
		return @service_request.passengers_departing * @preturi.on_request_checkin
	end
	
	
	def getGPUccV (service_request)
		return @service_request.gpu_v_cc_operations * @preturi.on_request_GPU_28_5
	end
	

	
	def getGPU_115(service_request)
		return @service_request.gpu_115v_operations * @preturi.on_request_GPU_115
	end
	
	def getAirStarter(service_request)
		return @service_request.air_starter_operations * @preturi.on_request_air_starter
	end
	
	def getLavatoryService(service_request)
		return @service_request.lavatory_service_operations * @preturi.on_request_lavatory
	end
	
	def getPotableWater(service_request)
		return @service_request.potable_water_operations * @preturi.on_request_water
	end
	
	def getTpBusPax (service_request)
		return @service_request.tp_bus_pax_operations * @preturi.on_request_bus_passanger
	end
	
	def getTpMiniBusPax(getTpBusPax)
		return @service_request.tp_minibus_pax_operations * @preturi.on_request_minibus_passanger
	end
	
	def getTpMinibusCrew(service_request)
		return @service_request.tp_minibus_crew_operations * @preturi.on_request_minibus_crew
	end
	
	def getCleaningServices(service_request)
		if (@preturi.on_request_cleaning_unit_rate > 0)
			return @service_request.cleaning_services_operations * @preturi.on_request_cleaning_unit_rate 
		end
		
		if (@service_request.number_of_seats < 40)
			return @service_request.cleaning_services_operations * @preturi.on_request_cleaning_40        
		end
		
		if (@service_request.number_of_seats < 100)
			return @service_request.cleaning_services_operations * @preturi.on_request_cleaning_40_100    
		end
		
		if (@service_request.number_of_seats < 150)
			return @service_request.cleaning_services_operations * @preturi.on_request_cleaning_100_150   
		else
			return @service_request.cleaning_services_operations * @preturi.on_request_cleaning_150_200   
		end
	end
	
	def TotalFaraTva(service_request)
		temp =      getLandingPrice(service_request) + 
					getLightingPrice(service_request) + 
					getParkingPrice(service_request) +
					getAirportPrice(service_request) +
					getPassengerService(service_request) +
					getPassengerSecurity(service_request) +
					getPassengerTranzit(service_request) +
					getBasicHandling(service_request)
	if  @service_request.checkin_req == true
			temp = temp + getCheckInTax(service_request)
	end		
	if @service_request.gpu_v_cc_req == true 
			temp = temp + getGPUccV (service_request)
	end
	
	if @service_request.gpu_115v_req == true
			temp = temp + getGPU_115(service_request)
	end
	
	if @service_request.air_starter_req == true
			temp = temp + getAirStarter(service_request)
	end
	
	if @service_request.lavatory_service_req == true
			temp = temp + getLavatoryService(service_request)
	end
	
	if @service_request.potable_water_req == true
			temp = temp + getPotableWater(service_request)
	end
	
	if @service_request.tp_bus_pax_req == true
			temp = temp + getTpBusPax(service_request)
	end
	
	if @service_request.tp_minibus_pax_req == true
			temp = temp + getTpMiniBusPax(getTpBusPax)
	end
	
	if @service_request.tp_minibus_crew_req == true
			temp = temp + getTpMinibusCrew(service_request)
	end
	
	if @service_request.cleaning_services_req == true
			temp = temp + getCleaningServices(service_request)
	end
	return temp
	
end

end
