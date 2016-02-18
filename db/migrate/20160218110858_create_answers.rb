class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :account, index: true
      t.references :question, index: true
      t.string :answer
      t.references :app, index: true
      t.datetime :deleted_at

      t.timestamps null: false
    end

    add_index :answers, :deleted_at
  end
end
