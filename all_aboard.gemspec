$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "all_aboard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "all_aboard"
  s.version     = AllAboard::VERSION
  s.authors     = ["Don Petersen"]
  s.email       = ["don@donpetersen.net"]
  s.homepage    = "http://githu.com/dpetersen/all_aboard"
  s.summary     = "A Rails engine to build your own status boards."
  s.description = "A Rails engine to build your own status boards."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency 'pg'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'sass-rails'
  s.add_dependency 'ember-rails'
  s.add_dependency 'ember-source', '1.1.2'
  s.add_dependency 'ember-data-source', '1.0.0.beta.3'
  s.add_dependency 'haml'
  s.add_dependency 'active_model_serializers'
  s.add_dependency 'resque'
  s.add_dependency 'redis'

  s.add_development_dependency 'thin'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'json'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'codeclimate-test-reporter'
end
