class Subscription < ActiveRecord::Base
  belongs_to :account
  belongs_to :entity, polymorphic: true
end
