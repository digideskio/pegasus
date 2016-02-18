class CreateBans < ActiveRecord::Migration
  def change
    create_table :bans do |t|
      t.references :account, index: true
      t.datetime :banned_until
      t.references :moderator
      t.string :reason
      t.string :appeal

      t.timestamps null: false
    end
  end
end
