class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :serial
      t.decimal :latitude, precision: 30, scale: 15
      t.decimal :longitude, precision: 30, scale: 15

      t.timestamps null: false
    end
  end
end
