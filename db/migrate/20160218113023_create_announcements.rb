class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.references :account, index: true
      t.string :header
      t.string :announcement

      t.timestamps null: false
    end
  end
end
