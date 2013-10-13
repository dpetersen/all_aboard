require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class SlidesController < AllAboard::Api::ApiController
    respond_to :json

    def index
      slides = AllAboard::Slide.where(id: params[:ids]).order(:position)
      all_assignments = slides.map(&:perspective_assignments).flatten

      respond_with(
        slides: ActiveModel::ArraySerializer.new(slides),
        perspective_assignments: ActiveModel::ArraySerializer.new(all_assignments)
      )
    end

    def show
      slide = AllAboard::Slide.find(params[:id])

      respond_with(
        slide: AllAboard::SlideSerializer.new(slide, root: false),
        perspective_assignments: ActiveModel::ArraySerializer.new(
          slide.perspective_assignments
        )
      )
    end
  end
end
