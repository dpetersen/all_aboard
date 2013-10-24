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
        templates: templates_for_assignments(all_assignments)
      )
    end

    def create
      board = AllAboard::Board.find(params[:slide][:board])
      params[:slide].delete(:board)
      respond_with board.slides.create!(create_slide_params), location: nil
    end

    def show
      slide = AllAboard::Slide.find(params[:id])

      respond_with(
        slide: AllAboard::SlideSerializer.new(slide, root: false),
        perspective_assignments: ActiveModel::ArraySerializer.new(
          slide.perspective_assignments
        ),
        templates: templates_for_assignments(slide.perspective_assignments)
      )
    end

  protected

    def create_slide_params
      params.require(:slide).permit(:position)
    end

    def templates_for_assignments(assignments)
      assignments.map(&:template_id).uniq.map do |combined_id|
        source_id, perspective_id, dimensions = combined_id.split(":")
        source = AllAboard::SourceManager.instance.find_by_id(source_id)
        perspective = source.perspectives.detect do |p|
          p.id.end_with?(perspective_id)
        end

        perspective.templates.detect do |t|
          t.id.end_with?(dimensions)
        end
      end
    end
  end
end
