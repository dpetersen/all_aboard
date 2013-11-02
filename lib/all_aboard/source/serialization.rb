module AllAboard::Source::Serialization
  extend ActiveSupport::Concern

  module ClassMethods
    def id
      name_without_suffix.underscore
    end

    def as_json(options = {})
      {
        id: id,
        name: name_without_suffix,
        configurable_attribute_ids: configurable_attributes.map(&:id),
        perspective_ids: perspectives.map(&:id)
      }
    end

  protected

    def name_without_suffix
      name.gsub(/Source$/, "")
    end
  end
end
