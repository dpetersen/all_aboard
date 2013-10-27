module AllAboard::PerspectiveAssignment::Source
  extend ActiveSupport::Concern

  def source
    @source ||=
      begin
        source_id = template_id.split(":").first
        @source = AllAboard::SourceManager.instance.find_by_id(source_id)
      end
  end

  def perspective
    @perspective ||=
      begin
        perspective_id = template_id.split(":").second
        source.perspectives.detect { |p| p.id.end_with?(perspective_id) }
      end
  end

  def configurable_attributes
    @configurable_attributes ||=
      begin
        perspective.configurable.map do |key, options|
          configurable_attribute = AllAboard::Source::ConfigurableAttribute.new(
            "#{perspective.id}:#{id}",
            key,
            perspective.configurable[key][:name],
            perspective.configurable[key][:description]
          )

          value = AllAboard::ConfigurableAttributeValue.
            where(configurable_attribute_id: configurable_attribute.id).first
          configurable_attribute.value = value.try(:value)

          configurable_attribute
        end
      end
  end
end
