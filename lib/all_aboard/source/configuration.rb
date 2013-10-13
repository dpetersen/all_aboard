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
      @configurable_attributes.map do |configurable_attribute|
        value = AllAboard::ConfigurableAttributeValue.
          where(configurable_attribute_id: configurable_attribute.as_json[:id]).first

        configurable_attribute.value = value.try(:value)
        configurable_attribute
      end
    end
  end
end
