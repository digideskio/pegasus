class Follow < ActiveRecord::Base
  include NotifyableMixin
  belongs_to :account
  belongs_to :destination, class_name: 'Account'

  has_many :notifications, as: 'entity', dependent: :destroy

  FOLLOW_MODE_NORMAL  = 0
  FOLLOW_MODE_BLOCK   = 1
  FOLLOW_MODE_PENDING = 2

  before_create :should_be_pending
  before_create :auto_unfollow

  def accept
    return unless mode == FOLLOW_MODE_PENDING
    self.mode = FOLLOW_MODE_NORMAL
    save
  end

  def deny
    return unless mode == FOLLOW_MODE_PENDING
    destroy
  end

  private

  def should_be_pending
    return unless mode == FOLLOW_MODE_NORMAL && destination.settings.is_private_account?
    self.mode = FOLLOW_MODE_PENDING
  end

  def auto_unfollow
    return unless mode == FOLLOW_MODE_BLOCK
    destination.unfollow account
  end
end
