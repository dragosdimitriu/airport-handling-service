class CreateFlightTypes < ActiveRecord::Migration
  def self.up
    create_table :flight_types do |t|

      t.string :name
      t.string :category
    end
  end

  def self.down
    drop_table :flight_types
  end
end
