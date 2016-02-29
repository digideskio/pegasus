Devise.setup do |config|
  config.secret_key = 'd3c045e2fe88c61a88809d5f49b2400359e66619b64eb31c3819fad9e4399da35a67e3204337aa1276bc5301e5e60ab00e1de36eaef453d6b0c488fb2afe14c2'

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.authentication_keys = [:username]
  config.case_insensitive_keys = [:username, :email]
  config.strip_whitespace_keys = [:username, :email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.pepper = 'baac97f053625117c2a0bbc8994beede148b14cd9ff93c4d7c884dddfbedd06d40ed9fcf80e22d4426c0d025346e43893272e9tomatocc4c31aee6d74008d378'

  config.send_password_change_notification = true
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.extend_remember_period = true
  config.password_length = 1..4611686018427387903
  config.reset_password_within = 1.hour
  config.default_scope = :account
  config.sign_out_via = :delete
end
