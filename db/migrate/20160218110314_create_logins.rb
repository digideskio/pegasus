class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.references :account, index: true
      t.inet :ip
      t.boolean :success
      t.string :useragent

      t.timestamps null: false
    end
  end
end
