class CreateMissionSessions < ActiveRecord::Migration
  def change
    create_table :mission_sessions do |t|
      t.integer :user_id, null: false
      t.integer :mission_id, null: false
      t.integer :status, null: false, default: 0
      t.datetime :started_at, null: false
      t.datetime :completed_at, null: false
      t.timestamps null: false
    end
  end
end
