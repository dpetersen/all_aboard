require 'database_cleaner'

RSpec.configure do |config|
  config.before(:each) do |example|
    DatabaseCleaner.clean_with(:truncation)
  end
end
