class CreateTransportations < ActiveRecord::Migration[7.0]
  def change
    create_table :transportations do |t|
      t.time :departure_time
      t.time :arrival_time
      t.float :price
      t.integer :seats

      t.timestamps
    end
  end
end
