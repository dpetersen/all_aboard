RSpec.configure do |config|
  config.after(:each) do |example|
    ResqueSpec.reset!
  end
end
