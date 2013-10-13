class AllAboard::Source::Perspective
  attr_reader :id, :filename, :name, :description

  def initialize(parent_id, filename, name = nil, description = nil)
    @id = "#{parent_id}:#{filename}"
    @filename = filename
    @name = name || filename.to_s
    @description = description
    @templates = []
  end

  def add_template(width, height, markup)
    @templates << AllAboard::Source::Template.new(@id, width, height, markup)
  end

  def templates
    @templates
  end

  def as_json(options = {})
    {
      id: id,
      name: name,
      description: description,
      templates: @templates.map(&:id)
    }
  end
end
