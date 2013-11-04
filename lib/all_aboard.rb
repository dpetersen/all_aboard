require 'coffee-rails'
require 'sass-rails'
require 'haml'
require 'ember-rails'
require 'active_model_serializers'
require 'redis'
require 'resque'

require "all_aboard/engine"

module AllAboard
  def self.redis
    @redis
  end

  def self.redis=(redis)
    @redis = redis
  end
end
