class Inbox < ActiveRecord::Base
  include PagableMixin

  acts_as_paranoid

  belongs_to :account
  belongs_to :question
end
