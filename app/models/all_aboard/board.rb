module AllAboard
  class Board < ActiveRecord::Base
    has_many :slides, dependent: :destroy

    validates :name, presence: true
  end
end
