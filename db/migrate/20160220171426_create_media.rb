class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.references :owner, polymorphic: true
      t.string :type
      t.string :path
      t.integer :path_crop_x
      t.integer :path_crop_y
      t.integer :path_crop_w
      t.integer :path_crop_h

      t.timestamps null: false
    end
    add_index :media, [:owner_id, :owner_type]
    add_index :media, :type
  end
end
