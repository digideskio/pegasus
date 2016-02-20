class App < Doorkeeper::Application
  # TODO: Hook into Doorkeeper::Application and call there.
  acts_as_paranoid

  self.table_name = 'oauth_applications'

  # TODO: After_create create empty record for avatar
  has_one :avatar, -> { where(type: 'avatar') }, as: 'owner', class_name: 'Medium'
end
