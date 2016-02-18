class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :account, index: true
      t.references :entity, polymorphic: true, index: true
      t.references :entity_owner, index: true
      t.string :reason
      t.references :assignee, index: true
      t.string :action_taken
      t.integer :status, null: false, default: 0 # 0 unresolved, 1 resolved, 2 frozen, 3 invalid, 4 needs more data

      t.timestamps null: false
    end
  end
end
