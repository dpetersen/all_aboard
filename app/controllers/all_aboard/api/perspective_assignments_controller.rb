require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class PerspectiveAssignmentsController < AllAboard::Api::ApiController
    respond_to :json

    def create
      slide_id = params[:perspective_assignment].delete(:slide)
      slide = AllAboard::Slide.find(slide_id)
      assignment = slide.perspective_assignments.create!(create_assignment_params)
      assignment.queue_for_all_frequencies

      response = {
        perspective_assignment: AllAboard::PerspectiveAssignmentSerializer.new(assignment, root: false),
        payloads: [
          { id: assignment.data_key, value: assignment.current_data }
        ]
      }
      respond_with(response, location: nil)
    end

    def update
      assignment = AllAboard::PerspectiveAssignment.find(params[:id])
      respond_with assignment.update_attributes!(update_assignment_params)
    end

    def destroy
      respond_with AllAboard::PerspectiveAssignment.
        find(params[:id]).
        destroy
    end

  protected

    def create_assignment_params
      params.require(:perspective_assignment).permit(:slide, :column, :row, :template)
    end

    def update_assignment_params
      params.require(:perspective_assignment).permit(:column, :row, :template)
    end
  end
end
