class FollowValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:destination] << I18n.t('model.error.blocked_follow') unless record.destination.block_list.find_by(destination: record.account).nil?
  end
end
