class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.references :account, index: true
      t.integer :primary_color
      t.integer :secondary_color
      t.integer :accent_color
      t.integer :font_color
      t.integer :secondary_font_color
      t.integer :accent_font_color
      t.integer :background_color

      t.timestamps null: false
    end
  end
end
