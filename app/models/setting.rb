class Setting < ActiveRecord::Base
  belongs_to :account

  has_one :ribbon, primary_key: 'username_ribbon_id'
end
