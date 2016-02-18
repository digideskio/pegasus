class Notification < ActiveRecord::Base
  belongs_to :account
  belongs_to :question
  belongs_to :answer
  belongs_to :entity, polymorphic: true
end
