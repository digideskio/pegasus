class Follow < ActiveRecord::Base
  include NotifyableMixin
  belongs_to :account
  belongs_to :destination, class_name: 'Account'

  has_many :notifications, as: 'entity', dependent: :destroy

  FOLLOW_MODE_NORMAL  = 0
  FOLLOW_MODE_BLOCK   = 1
  FOLLOW_MODE_PENDING = 2

  validates_with FollowValidator
  before_create :should_be_pending
  before_create :automagic

  def accept
    return unless self.mode == FOLLOW_MODE_PENDING
    self.mode = FOLLOW_MODE_NORMAL
    save
  end

  def reject
    return unless self.mode == FOLLOW_MODE_PENDING
    destroy
  end

  private

  def should_be_pending
    return if self.mode == FOLLOW_MODE_BLOCK
    if destination.setting.private_account?
      self.mode = FOLLOW_MODE_PENDING
    else
      self.mode = FOLLOW_MODE_NORMAL
    end
  end

  def automagic
    if self.mode == FOLLOW_MODE_BLOCK
      destination.unfollow account
      account.unfollow destination
    else
      account.unblock destination
    end
  end
end
