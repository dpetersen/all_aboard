module AllAboard::Source::Configuration
  extend ActiveSupport::Concern

  module ClassMethods
    def configurable(*attributes)
      @configurable_attributes = attributes
    end

    def configuration
      @configurable_attributes.each_with_object({}) do |attribute, h|
        h[attribute] = nil
      end
    end
  end
end
