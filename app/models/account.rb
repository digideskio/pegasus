class Account < ActiveRecord::Base
  acts_as_paranoid

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable

  has_many :answers, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :inboxes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :followers, foreign_key: 'destination_id', class_name: 'Follow', dependent: :destroy
  has_many :hearts, dependent: :destroy
  has_many :bans
  has_many :reports
  has_many :reporteds, as: 'entity', class_name: 'Report'
  has_many :reportees, foreign_key: 'entity_owner_id', class_name: 'Report'
  has_many :assignees, foreign_key: 'assignee_id', class_name: 'Report'
  has_many :logins
  has_many :apps, foreign_key: 'resource_owner_id', class_name: 'App', dependent: :destroy

  has_one  :profile
  has_one  :theme
  has_one  :setting
end
