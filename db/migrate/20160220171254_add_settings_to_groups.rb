class AddSettingsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :allow_public_questions, :boolean
  end
end
