module AllAboard
  class PerspectiveAssignment < ActiveRecord::Base
    belongs_to :slide

    validates :slide, :template_id, :column, :row, presence: true
  end
end
