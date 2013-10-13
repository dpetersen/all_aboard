class AllAboard::Source::Template
  attr_reader :id, :width, :height, :markup

  def initialize(parent_id, width, height, markup)
    @width, @height = width, height
    @id = "#{parent_id}:#{width}x#{height}"
    @markup = markup
  end

  def as_json(options = {})
    {
      id: id,
      width: width,
      height: height,
      markup: markup
    }
  end
end
