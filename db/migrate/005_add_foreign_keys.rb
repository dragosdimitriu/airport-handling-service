class AddForeignKeys < ActiveRecord::Migration
  def self.up
    	execute "alter table service_types add constraint fk_service_types_flight_types foreign key (flight_type_id) references flight_types(id)"
  end

  def self.down
  end
end
