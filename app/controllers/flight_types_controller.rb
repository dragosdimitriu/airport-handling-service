include ApplicationHelper
class FlightTypesController < ApplicationController
  
  before_filter :get_access
  
  def index
    @flight_types = FlightType.find(:all)
  end
  
  def show
  end
  
  def new
    @category = Array.new
    @flight_type = FlightType.new
    @category = ["International", "Domestic", "Helicopter"]
  end
  
  def create

    @flight_type = FlightType.new(params[:flight_type])
    #save created flight type
    @flight_type.save!
    @service_type = ServiceType.new(params[:service_type])
    @service_type.flight_type_id = @flight_type.id
    #save created service type
    if @service_type.save!
     redirect_to flight_types_path
     notice_stickie("New aircraft and services created.")
   else
     redirect_to new_flight_types
      error_stickie("Could not create aircraft. Pls try again")
   end
     
  end
  
  def update   
  end
  
  def edit
    @flight_type = FlightType.find(params[:id])
    @service_type = ServiceType.find(:first, :conditions => [ "flight_type_id = ?", params[:id]])
  end
  
  def destroy
    @flight_type = FlightType.find(params[:id])
    @service_type = ServiceType.find(:first, :conditions => ["flight_type_id = ?", @flight_type.id])
    
    #destroy child
    @service_type.destroy
    #destroy parent
    @flight_type.destroy
    redirect_to flight_types_path
  end

  
end
