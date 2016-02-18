class CreateApiCalls < ActiveRecord::Migration
  def change
    create_table :api_calls do |t|
      t.references :account, index: true
      t.references :app, index: true
      t.string :endpoint
      t.integer :status

      t.timestamps null: false
    end
  end
end
