class Ban < ActiveRecord::Base
  belongs_to :account
  belongs_to :moderator, primary_key: 'moderator_key', class_name: 'Account'
end
