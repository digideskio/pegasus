class Report < ActiveRecord::Base
  include PagableMixin

  belongs_to :account
  belongs_to :entity, polymorphic: true
  belongs_to :reporter, primary_key: 'entity_owner_id', class_name: 'Account'
  belongs_to :assignee, primary_key: 'assignee_id', class_name: 'Account'
end
