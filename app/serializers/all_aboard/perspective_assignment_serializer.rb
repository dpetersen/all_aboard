module AllAboard
  class PerspectiveAssignmentSerializer < ActiveModel::Serializer
    attributes :id, :template, :column, :row

    def template
      object.template_id
    end
  end
end
