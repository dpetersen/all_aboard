module AllAboard::Source::Serialization
  extend ActiveSupport::Concern

  module ClassMethods
    def as_json(options = {})
      {
        id: name,
        name: name.gsub(/Source$/, "")
      }
    end
  end
end
