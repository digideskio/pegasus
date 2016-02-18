class Follow < ActiveRecord::Base
  belongs_to :account

  has_many :notifications, as: 'entity', dependent: :destroy
end
