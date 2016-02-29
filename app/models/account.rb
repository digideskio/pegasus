class Account < ActiveRecord::Base
  include PagableMixin

  acts_as_paranoid

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

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
  has_many :apps, as: 'owner', class_name: 'App', dependent: :destroy

  has_one  :profile
  has_one  :theme
  has_one  :setting

  after_create :setup

  def blocklist
    follows.where(mode: Follow::FOLLOW_MODE_BLOCK)
  end

  def pending_follows
    follows.where(mode: Follow::FOLLOW_MODE_PENDING)
  end

  def actual_follows
    follows.where(mode: Follow::FOLLOW_MODE_NORMAL)
  end

  def combined_follows
    follows.where.not(mode: Follow::FOLLOW_MODE_BLOCK)
  end

  def track_link!(success = false)
    Login.create!(account: self, ip: request.remote_ip, success: success, useragent: request.user_agent)
    return success
  end

  # override
  def valid_for_authentication?
    track_link! super
  end

  private

  def setup
    Setting.create(account:                   self,
                   allow_anonymous_questions: true,
                   hide_follower_blocks:      false,
                   display_themes:            true,
                   private_account:           false,
                   show_in_public:            true,
                   show_in_search:            true,
                   explicit:                  false,
                   display_ribbon_mask:       -1,
                   username_ribbon_id:        -1)
    Profile.create(account: self, ribbons: 0)
    Theme.create(account: self)
  end
end
