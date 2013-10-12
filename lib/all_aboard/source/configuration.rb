module AllAboard::Source::Configuration
  extend ActiveSupport::Concern

  module ClassMethods
    def configurable(key, options = {})
      @configurable_attributes ||= []
      attribute = AllAboard::Source::ConfigurableAttribute.new(
        as_json[:id],
        key,
        options[:name],
        options[:description]
      )
      @configurable_attributes << attribute
    end

    def configurable_attributes
      @configurable_attributes
    end
  end
end
