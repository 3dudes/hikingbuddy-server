class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :name, null: false
      t.integer :start_location_id, null: false
      t.integer :end_location_id, null: false

      t.timestamps null: false
    end
  end
end
