class CreateRoutePositions < ActiveRecord::Migration
  def change
    create_table :route_positions do |t|
      t.decimal :latitude, precision: 15, scale: 10, null: false
      t.decimal :longitude, precision: 15, scale: 10, null: false
      t.integer :mission_id, null: false
      t.integer :order, null: false

      t.timestamps null: false
    end
  end
end
