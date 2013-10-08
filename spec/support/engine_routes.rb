module EngineRoutesHelper
  def engine_routes
    AllAboard::Engine.routes.url_helpers
  end
end

RSpec.configure do |config|
  config.include EngineRoutesHelper, type: :feature
end
