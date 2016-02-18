class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
      t.references :account, index: true
      t.references :question, index: true
      t.boolean :new, null: false, default: true

      t.datetime :deleted_at
      t.timestamps null: false
    end
    add_index :inboxes, :deleted_at
  end
end
