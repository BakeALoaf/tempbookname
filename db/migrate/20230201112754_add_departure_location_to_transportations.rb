class AddDepartureLocationToTransportations < ActiveRecord::Migration[7.0]
  def change
    add_column :transportations, :departure_location, :string
  end
end
