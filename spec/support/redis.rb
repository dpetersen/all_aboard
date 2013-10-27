RSpec.configure do |config|
  config.before(:each) do |example|
    AllAboard.redis = Redis.new
  end
end
