require 'database_cleaner'

RSpec.configure do |config|
  DatabaseCleaner.strategy = :transaction

  config.around(:each) do |example|
    if example.metadata[:js]
      example.run
      DatabaseCleaner.clean_with(:truncation)
    else
      DatabaseCleaner.start
      example.run
      DatabaseCleaner.clean
    end
  end
end
