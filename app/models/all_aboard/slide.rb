module AllAboard
  class Slide < ActiveRecord::Base
    belongs_to :board

    validates :board, :position, presence: true
  end
end
