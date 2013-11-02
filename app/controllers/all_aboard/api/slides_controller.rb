require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class SlidesController < AllAboard::Api::ApiController
    respond_to :json

    def index
      slides = AllAboard::Slide.where(id: params[:ids]).order(:position)
      all_assignments = slides.map(&:perspective_assignments).flatten

      respond_with(
        slides: ActiveModel::ArraySerializer.new(slides),
        perspective_assignments: ActiveModel::ArraySerializer.new(all_assignments),
        configurable_attributes: configurable_attributes_for(all_assignments),
        templates: templates_for_assignments(all_assignments),
        payloads: payload_for_assignments(all_assignments)
      )
    end

    def create
      board_id = params[:slide].delete(:board_id)
      board = AllAboard::Board.find(board_id)

      respond_with board.slides.create!(create_slide_params), location: nil
    end

    def show
      slide = AllAboard::Slide.find(params[:id])
      assignments = slide.perspective_assignments

      respond_with(
        slide: AllAboard::SlideSerializer.new(slide, root: false),
        perspective_assignments: ActiveModel::ArraySerializer.new(assignments),
        configurable_attributes: configurable_attributes_for(assignments),
        templates: templates_for_assignments(assignments),
        payloads: payload_for_assignments(assignments)
      )
    end

  protected

    def create_slide_params
      params.require(:slide).permit(:position)
    end

    def templates_for_assignments(assignments)
      assignments.map do |assignment|
        dimensions = assignment.template_id.split(":").last
        assignment.perspective.templates.detect do |t|
          t.id.end_with?(dimensions)
        end
      end.uniq
    end

    def configurable_attributes_for(assignments)
      assignments.map(&:configurable_attributes).flatten
    end

    def payload_for_assignments(assignments)
      assignments.map do |assignment|
        {
          id: assignment.data_key,
          value: assignment.current_data
        }
      end
    end
  end
end
