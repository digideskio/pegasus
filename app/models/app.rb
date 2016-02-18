class App < Doorkeeper::Application
  acts_as_paranoid # TODO: Hook into Doorkeeper::Application and call there.

  table_name = 'oauth_applications'
end
