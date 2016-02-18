class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :account, index: true
      t.references :entity, polymorphic: true, index: true
      t.boolean :subscribed, null: false, default: true

      t.timestamps null: false
    end
  end
end
