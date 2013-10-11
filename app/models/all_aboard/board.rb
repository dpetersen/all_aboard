module AllAboard
  class Board < ActiveRecord::Base
    has_many :slides

    validates :name, presence: true
  end
end
