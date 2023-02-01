class AddLocationToAccommodations < ActiveRecord::Migration[7.0]
  def change
    add_column :accommodations, :location, :string
  end
end
