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
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
