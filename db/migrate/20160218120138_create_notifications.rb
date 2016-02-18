class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :account, index: true
      t.references :question, index: true
      t.references :answer, index: true
      t.references :entity, polymorphic: true, index: true
      t.boolean :new, null: false, default: true

      t.timestamps null: false
    end
  end
end
