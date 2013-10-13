module AllAboard
  class Slide < ActiveRecord::Base
    belongs_to :board
    has_many :perspective_assignments, dependent: :destroy

    validates :board, :position, presence: true
  end
end
