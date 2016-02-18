class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :account, index: true
      t.string :question
      t.integer :private, null: false, default: 0 # 0 - public, 1 - followers only, 2 - private
      t.boolean :anonymous, null: false, default: false
      t.references :app, index: true
      t.datetime :deleted_at

      t.timestamps null: false
    end

    add_index :questions, :deleted_at
  end
end
