module AllAboard
  class BoardSerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end
