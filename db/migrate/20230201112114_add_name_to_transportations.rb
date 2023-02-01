class AddNameToTransportations < ActiveRecord::Migration[7.0]
  def change
    add_column :transportations, :name, :string
  end
end
