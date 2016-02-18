class CreateHearts < ActiveRecord::Migration
  def change
    create_table :hearts do |t|
      t.references :account, index: true
      t.references :entity, polymorphic: true, index: true
      t.boolean :loved, null: false, default: true

      t.timestamps null: false
    end
  end
end
