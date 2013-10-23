require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class PerspectiveAssignmentsController < AllAboard::Api::ApiController
    respond_to :json

    def update
      respond_with AllAboard::PerspectiveAssignment.
        find(params[:id]).
        update_attributes!(assignment_params)
    end

  protected

    def assignment_params
      params.require(:perspective_assignment).permit(:column, :row, :template)
    end
  end
end
