class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :account, index: true
      t.references :destination, index: true
      t.integer :mode, null: false, default: 0 # 0 - follow 1 - block

      t.timestamps null: false
    end
  end
end
