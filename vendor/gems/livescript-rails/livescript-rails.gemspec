$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'livescript/rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'livescript-rails'
  s.version     = Livescript::Rails::VERSION
  s.authors     = ['foo']
  s.homepage    = 'about:blank'
  s.summary     = 'Livescript for Rails'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.2'
  s.add_runtime_dependency 'execjs'
  s.add_runtime_dependency 'livescript'
  s.add_runtime_dependency 'railties'
  s.add_runtime_dependency 'tilt'

end
