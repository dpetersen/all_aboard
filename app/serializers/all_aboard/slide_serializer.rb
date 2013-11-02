module AllAboard
  class SlideSerializer < ActiveModel::Serializer
    embed :ids

    has_many :perspective_assignments
    has_one :board

    attributes :id
  end
end
