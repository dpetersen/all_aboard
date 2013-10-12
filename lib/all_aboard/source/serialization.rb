module AllAboard::Source::Serialization
  extend ActiveSupport::Concern

  module ClassMethods
    def as_json(options = {})
      name_without_suffix = name.gsub(/Source$/, "")

      {
        id: name_without_suffix.underscore,
        name: name_without_suffix
      }
    end
  end
end
