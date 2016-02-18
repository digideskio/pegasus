class Question < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :account
  belongs_to :app
  belongs_to :deleter, primary_key: 'deleted_by_id', class_name: 'Account'

  has_many :subscriptions, as: 'entity', dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :reports, as: 'entity'
  has_many :inboxes, dependent: :destroy
  has_many :parent_notifications, foreign_key: 'question_id', class_name: 'Notification', dependent: :destroy
  has_many :notifications, as: 'entity', dependent: :destroy
end
