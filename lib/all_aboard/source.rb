module AllAboard
  class Source
    def self.configurable(*attributes)
      @configurable_attributes = attributes
    end

    def self.configuration
      @configurable_attributes.each_with_object({}) do |attribute, h|
        h[attribute] = nil
      end
    end

    def self.as_json(options = {})
      {
        id: name,
        name: name.gsub(/Source$/, "")
      }
    end
  end
end
