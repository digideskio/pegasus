class Report < ActiveRecord::Base
  belongs_to :account
  belongs_to :entity, polymorphic: true
  belongs_to :entity_owner
end
