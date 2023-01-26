class CreateItineraries < ActiveRecord::Migration[7.0]
  def change
    create_table :itineraries do |t|
      t.string :destination
      t.date :departure_date
      t.date :arrival_date

      t.timestamps
    end
  end
end
