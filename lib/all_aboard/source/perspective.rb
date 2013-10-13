class AllAboard::Source::Perspective
  attr_reader :id, :filename, :name, :description

  def initialize(parent_id, filename, name = nil, description = nil)
    @id = "#{parent_id}:#{filename}"
    @filename = filename
    @name = name || filename.to_s
    @description = description
    @sizes = []
  end

  def add_size(width, height)
    @sizes << [ width, height ]
  end

  def sizes
    @sizes
  end
end
