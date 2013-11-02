module AllAboard
  class PerspectiveAssignmentSerializer < ActiveModel::Serializer
    attributes :id, :column, :row,
      :payload_id, :template_id, :configurable_attribute_ids, :slide_id

    def configurable_attribute_ids
      object.configurable_attributes.map(&:id)
    end

    def payload_id
      object.data_key
    end
  end
end
