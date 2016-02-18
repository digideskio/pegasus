class Heart < ActiveRecord::Base
  belongs_to :entity, polymorphic: true
  belongs_to :account
  
  has_many :notifications, as: 'entity', dependent: :destroy
end
