class AddNameToAccommodations < ActiveRecord::Migration[7.0]
  def change
    add_column :accommodations, :name, :string
  end
end
