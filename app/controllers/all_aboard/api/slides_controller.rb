require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class SlidesController < AllAboard::Api::ApiController
    def index
      slides = AllAboard::Slide.where(id: params[:ids]).order(:position)
      render json: slides, each_serializer: AllAboard::SlideSerializer
    end
  end
end
