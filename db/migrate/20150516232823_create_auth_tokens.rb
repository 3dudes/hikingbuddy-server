class CreateAuthTokens < ActiveRecord::Migration
  def change
    create_table :auth_tokens do |t|
      t.integer :user_id, null: false
      t.string :token, null: false
      t.date :last_request_on

      t.timestamps null: false
    end
  end
end
