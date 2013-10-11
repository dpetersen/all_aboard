module AllAboard
  class SlideSerializer < ActiveModel::Serializer
    attributes :id, :board_id
  end
end
