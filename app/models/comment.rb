class Comment < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :account
  belongs_to :answer
  belongs_to :app 
  belongs_to :deleter, primary_key: 'deleted_by_id', class_name: 'Account'

  has_many :reports, as: 'entity'
  has_many :hearts, as: 'entity', dependent: :destroy
  has_many :notifications, as: 'entity', dependent: :destroy
end
