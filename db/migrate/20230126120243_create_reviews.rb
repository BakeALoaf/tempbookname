class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.float :rate
      t.text :comment
      t.references :itinerary, null: false, foreign_key: true
      t.references :transportation, null: false, foreign_key: true
      t.references :accommodation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
