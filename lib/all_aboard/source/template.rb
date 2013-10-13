class AllAboard::Source::Template
  attr_reader :id, :width, :height

  def initialize(parent_id, width, height)
    @width, @height = width, height
    @id = "#{parent_id}:#{width}x#{height}"
  end
end
