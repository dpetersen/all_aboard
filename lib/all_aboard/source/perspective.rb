class AllAboard::Source::Perspective
  attr_reader :id, :filename, :name, :description, :configurable

  def initialize(parent_id, filename, name = nil, description = nil, configurable = nil, jobs = nil)
    @id = "#{parent_id}:#{filename}"
    @filename = filename
    @name = name || filename.to_s
    @description = description
    @templates = []
    @configurable = configurable || []
    @jobs = jobs || []
  end

  def add_template(width, height, markup)
    @templates << AllAboard::Source::Template.new(@id, width, height, markup)
  end

  def reset_templates
    @templates = []
  end

  def templates
    @templates
  end

  def jobs_for_frequency(frequency)
    @jobs.select { |job| job.frequency == frequency }
  end

  def as_json(options = {})
    {
      id: id,
      name: name,
      description: description,
      template_ids: @templates.map(&:id)
    }
  end
end
