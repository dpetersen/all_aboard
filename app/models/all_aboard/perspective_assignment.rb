module AllAboard
  class PerspectiveAssignment < ActiveRecord::Base
    belongs_to :slide

    validates :slide, :template_id, :column, :row, presence: true

    def template=(template_id)
      self.template_id = template_id
    end

    def source
      @source ||=
        begin
          source_id = template_id.split(":").first
          @sourceAllAboard::SourceManager.instance.find_by_id(source_id)
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
end
