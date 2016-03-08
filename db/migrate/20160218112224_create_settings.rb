class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.references :account, index: true
      t.boolean :allow_anonymous_questions
      t.boolean :hide_follower_blocks
      t.boolean :display_themes
      t.boolean :private_account
      t.boolean :show_in_public
      t.boolean :show_in_search
      t.boolean :explicit
      t.integer :display_ribbon_mask
      t.integer :username_ribbon_id

      t.timestamps null: false
    end
  end
end
