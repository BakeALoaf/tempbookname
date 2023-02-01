class AddArrivalLocationToTransportations < ActiveRecord::Migration[7.0]
  def change
    add_column :transportations, :arrival_location, :string
  end
end
