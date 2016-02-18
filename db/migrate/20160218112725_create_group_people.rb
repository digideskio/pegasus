class CreateGroupPeople < ActiveRecord::Migration
  def change
    create_table :group_people do |t|
      t.references :group, index: true
      t.references :account, index: true

      t.timestamps null: false
    end
  end
end
