class AllAboard::Source::ConfigurableAttribute
  attr_reader :id, :key, :name, :description
  attr_accessor :value

  def initialize(parent_id, key, name = nil, description = nil)
    @id = "#{parent_id}:#{key}"
    @key, @description = key, description
    @name = name || key.to_s.humanize
  end

  def as_json(options = {})
    {
      id: id,
      key: key,
      name: name,
      description: description,
      value: value
    }
  end
end
