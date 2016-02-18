class Subscription < ActiveRecord::Base
  belongs_to :account
  belongs_to :entity, polymorphic: true

  def self.batch(base, target)
    Subscription.find_each(entity: target, subscribed: true) do |record|
      if record.account.deleted?
        next
      end

      n = base.clone
      n.account = record.account
    end
  end
end
