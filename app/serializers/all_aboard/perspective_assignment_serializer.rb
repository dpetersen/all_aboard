module AllAboard
  class PerspectiveAssignmentSerializer < ActiveModel::Serializer
    attributes :id, :template, :column, :row, :configurableAttributes

    def configurableAttributes
      object.configurable_attributes.map(&:id)
    end

    def template
      object.template_id
    end
  end
end
