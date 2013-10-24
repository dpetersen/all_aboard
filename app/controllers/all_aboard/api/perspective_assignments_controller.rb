require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class PerspectiveAssignmentsController < AllAboard::Api::ApiController
    respond_to :json

    def create
      slide_id = params[:perspective_assignment].delete(:slide)
      slide = AllAboard::Slide.find(slide_id)
      respond_with slide.perspective_assignments.create!(create_assignment_params), location: nil
    end

    def update
      respond_with AllAboard::PerspectiveAssignment.
        find(params[:id]).
        update_attributes!(update_assignment_params)
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
