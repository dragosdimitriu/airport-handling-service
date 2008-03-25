include ApplicationHelper
class ServiceTypesController < ApplicationController

  before_filter :get_access
  
  def update
    
    @service_type = ServiceType.find(params[:id])
    @flight_type = FlightType.find(params[:id])
    @service_type.update_attributes(params[:service_type])
      notice_stickie("Service succesfully updated.")
      redirect_to flight_types_url

  end
  
end