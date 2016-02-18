class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :account, index: true
      t.string :name
      t.boolean :private
      t.boolean :hide_member_blocks
      t.boolean :replace_home

      t.timestamps null: false
    end
  end
end
