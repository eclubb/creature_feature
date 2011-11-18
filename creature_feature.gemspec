$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'creature_feature/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'creature_feature'
  s.version     = CreatureFeature::VERSION
  s.authors     = ['Earle Clubb']
  s.email       = ['eclubb@valcom.com']
  s.homepage    = ''
  s.summary     = 'Role/Feature engine for Rails 3.1.'
  s.description = 'Rails 3.1 engine which adds the ability to build roles from features you create.'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 3.1.1'
  s.add_dependency 'haml-rails'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'cucumber-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-cucumber'
end
