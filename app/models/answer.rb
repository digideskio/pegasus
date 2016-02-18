class Answer < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :account
  belongs_to :question
  belongs_to :app 
  belongs_to :deleter, primary_key: 'deleted_by_id', class_name: 'Account'

  has_many :subscriptions, as: 'entity'
  has_many :comments, dependent: :destroy
  has_many :hearts, as: 'entity', dependent: :destroy
  has_many :reports, as: 'entity'
  has_many :parent_notifications, foreign_key: 'answer_id', class_name: 'Notification', dependent: :destroy
  has_many :notifications, as: 'entity', dependent: :destroy
end
