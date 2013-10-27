module AllAboard
  class PerspectiveAssignmentSerializer < ActiveModel::Serializer
    attributes :id, :template, :column, :row, :configurableAttributes, :payload

    def configurableAttributes
      object.configurable_attributes.map(&:id)
    end

    def template
      object.template_id
    end

    def payload
      object.data_key
    end
  end
end
