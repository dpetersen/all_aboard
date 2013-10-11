module AllAboard
  class BoardSerializer < ActiveModel::Serializer
    has_many :slides, key: :slides, embed: :ids

    attributes :id, :name
  end
end
