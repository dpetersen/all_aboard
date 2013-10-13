module AllAboard
  class PerspectiveAssignmentSerializer < ActiveModel::Serializer
    attributes :id, :template_id, :column, :row
  end
end
