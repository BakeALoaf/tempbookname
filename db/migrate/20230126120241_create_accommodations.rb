class CreateAccommodations < ActiveRecord::Migration[7.0]
  def change
    create_table :accommodations do |t|
      t.float :price
      t.integer :rooms
      t.text :amenities

      t.timestamps
    end
  end
end
