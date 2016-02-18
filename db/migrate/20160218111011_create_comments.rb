class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :account, index: true
      t.references :answer, index: true
      t.string :comment
      t.references :app, index: true
      t.datetime :deleted_at

      t.timestamps null: false
    end

    add_index :comments, :deleted_at
  end
end
