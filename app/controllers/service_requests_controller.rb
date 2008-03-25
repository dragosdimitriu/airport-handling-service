include ServiceRequestsHelper
include ApplicationHelper
class ServiceRequestsController < ApplicationController
  
  before_filter :get_access
  # GET /service_requests
  # GET /service_requests.xml
  def index
    
    @service_requests = ServiceRequest.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_requests }
    end
  end


  # GET /service_requests/1
  # GET /service_requests/1.xml
  def show
    @service_request = ServiceRequest.find(params[:id])
	@flight_type = FlightType.find(@service_request.a_c_type)
	@preturi = @flight_type.service_type 
	
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_request }
    end
  end

  # GET /service_requests/new
  # GET /service_requests/new.xml
  def new
    @service_request = ServiceRequest.new
	  @flight_types = FlightType.find(:all).map {|m| [m.name, m.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_request }
    end
  end

  # GET /service_requests/1/edit
  def edit
  @service_request = ServiceRequest.find(params[:id])
	@flight_types = FlightType.find(:all).map {|m| [m.name, m.id]}
	@selected = {:selected => @service_request.a_c_type}

  end

  # POST /service_requests
  # POST /service_requests.xml
  def create
    @service_request = ServiceRequest.new(params[:service_request])

    respond_to do |format|
      if @service_request.save
        #flash[:notice] = 'ServiceRequest was successfully created.'
        notice_stickie("ServiceRequest was successfully created.")
        format.html { redirect_to(edit_service_request_path(@service_request)) }
        format.xml  { render :xml => @service_request, :status => :created, :location => @service_request }
      else
		@flight_types = FlightType.find(:all).map {|m| [m.name, m.id]}
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_requests/1
  # PUT /service_requests/1.xml
  def update
    @service_request = ServiceRequest.find(params[:id])

    respond_to do |format|
      if @service_request.update_attributes(params[:service_request])
        #flash[:notice] = 'ServiceRequest was successfully updated.'
        notice_stickie("ServiceRequest was successfully updated.")
        format.html { redirect_to(@service_request) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_requests/1
  # DELETE /service_requests/1.xml
  def destroy
    @service_request = ServiceRequest.find(params[:id])
    @service_request.destroy
    notice_stickie("ServiceRequest destroyed.")
    
    respond_to do |format|
      format.html { redirect_to(service_requests_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
    
    unless params[:date_search].blank?
      @start_date = DateTime.civil(params[:date_search][:"date_start(1i)"].to_i, params[:date_search][:"date_start(2i)"].to_i, params[:date_search][:"date_start(3i)"].to_i, params[:date_search][:"date_start(4i)"].to_i, params[:date_search][:"date_start(5i)"].to_i)
      @stop_date = DateTime.civil(params[:date_search][:"date_stop(1i)"].to_i, params[:date_search][:"date_stop(2i)"].to_i, params[:date_search][:"date_stop(3i)"].to_i, params[:date_search][:"date_stop(4i)"].to_i, params[:date_search][:"date_stop(5i)"].to_i)
    end
    
    unless params[:search_airline].blank?
      @service_requests = ServiceRequest.find(:all, :conditions => ["landing BETWEEN ? and ? and airline =?", @start_date, @stop_date, params[:search_airline]])
      if @service_requests.size == 0
        error_stickie("No results found.")
      else
        notice_stickie("#{@service_requests.size} results found.")
      end
    end
    
    unless params[:search_mtow].blank?
      @service_requests = ServiceRequest.find(:all, :conditions => ["landing BETWEEN ? and ? and mtow=?", @start_date, @stop_date, params[:search_mtow]])
      if @service_requests.size == 0
        error_stickie("No results found.")
      else
        notice_stickie("#{@service_requests.size} results found.")
      end
    end
    
    unless params[:search_handling_id].blank?
      @service_requests = ServiceRequest.find(:all, :conditions => ["landing BETWEEN ? and ? and id=?",  @start_date, @stop_date, params[:search_handling_id]])
      if @service_requests.size == 0
        error_stickie("No results found.")
      else
        notice_stickie("#{@service_requests.size} results found.")
      end
    end
    
    respond_to do |format|
      format.html
    end
  end
  
  def report_stat
    
    @flights_int =0
    @passangers_arr_int =0
    @passangers_dep_int =0
    @passangers_tran_int =0
    @cargo_arr_int=0
    @cargo_dep_int = 0 
    @flights_dom=0
    @passangers_arr_dom=0
    @passangers_dep_dom=0
    @passangers_tran_dom=0
    @cargo_arr_dom =0
    @cargo_dep_dom = 0 
    unless params[:date_search_stats].blank?
      @start_date = DateTime.civil(params[:date_search_stats][:"date_start_stats(1i)"].to_i, params[:date_search_stats][:"date_start_stats(2i)"].to_i, params[:date_search_stats][:"date_start_stats(3i)"].to_i, params[:date_search_stats][:"date_start_stats(4i)"].to_i, params[:date_search_stats][:"date_start_stats(5i)"].to_i)
      @stop_date = DateTime.civil(params[:date_search_stats][:"date_stop_stats(1i)"].to_i, params[:date_search_stats][:"date_stop_stats(2i)"].to_i, params[:date_search_stats][:"date_stop_stats(3i)"].to_i, params[:date_search_stats][:"date_stop_stats(4i)"].to_i, params[:date_search_stats][:"date_stop_stats(5i)"].to_i)
      @flights_int,@passangers_arr_int,@passangers_dep_int,@passangers_tran_int,@cargo_arr_int,@cargo_dep_int= ServiceRequest.total_international_flights(@start_date, @stop_date)
      @flights_dom,@passangers_arr_dom,@passangers_dep_dom,@passangers_tran_dom,@cargo_arr_dom,@cargo_dep_dom= ServiceRequest.total_domestic_flights(@start_date, @stop_date)
      @interval_start = params[:date_search_stats][:"date_start_stats(1i)"]+"-"+params[:date_search_stats][:"date_start_stats(2i)"]+"-"+params[:date_search_stats][:"date_start_stats(3i)"]
      @interval_stop = params[:date_search_stats][:"date_stop_stats(1i)"]+"-"+params[:date_search_stats][:"date_stop_stats(2i)"]+"-"+params[:date_search_stats][:"date_stop_stats(3i)"]
    end  
    
    respond_to do |format|
			format.html
		end
      
  end
  
  def report_stat_result
    respond_to do |format|
			format.js
		end
  end

  
end
