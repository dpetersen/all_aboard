module ApiExampleGroup
  extend ActiveSupport::Concern

  included do
    metadata[:type] = :api
  end

  RSpec.configure do |config|
    config.include(
      self,
      type: :api,
      example_group: { file_path: %r(spec/api) }
    )
  end
end

module RackTestHelpers
  include Rack::Test::Methods

  def app
    Dummy::Application
  end
end

RSpec.configure do |config|
  config.include RackTestHelpers, type: :api
end
