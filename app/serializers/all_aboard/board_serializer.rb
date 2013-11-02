module AllAboard
  class BoardSerializer < ActiveModel::Serializer
    embed :ids
    has_many :slides

    attributes :id, :name
  end
end
