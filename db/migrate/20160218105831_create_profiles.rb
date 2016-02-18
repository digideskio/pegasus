class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :account, index: true
      t.string :name
      t.string :bio
      t.string :header
      t.integer :ribbons, null: false, default: 0

      t.timestamps null: false
    end
  end
end
