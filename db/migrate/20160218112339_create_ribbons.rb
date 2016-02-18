class CreateRibbons < ActiveRecord::Migration
  def change
    create_table :ribbons do |t|
      t.string :name
      t.string :icon_class
      t.integer :color
      t.integer :font_color

      t.timestamps null: false
    end
  end
end
