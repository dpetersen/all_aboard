module AllAboard
  class PerspectiveAssignment < ActiveRecord::Base
    include AssociatedSource
    include JobExecution
    include JobData

    belongs_to :slide

    validates :slide, :template_id, :column, :row, presence: true

    def template=(template_id)
      self.template_id = template_id
    end
  end
end
