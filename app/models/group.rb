class Group < ActiveRecord::Base
  belongs_to :account
  has_many :group_people, dependent: :destroy
end
