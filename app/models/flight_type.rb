class FlightType < ActiveRecord::Base
  has_one :service_type
end
