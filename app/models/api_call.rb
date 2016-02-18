class ApiCall < ActiveRecord::Base
  belongs_to :account
  belongs_to :app
end
