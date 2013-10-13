module AllAboard
  class SlideSerializer < ActiveModel::Serializer
    embed :ids

    attributes :id, :board_id
    has_many :perspective_assignments, key: "perspectiveAssignments"
  end
end
