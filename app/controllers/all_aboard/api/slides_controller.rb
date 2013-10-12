require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class SlidesController < AllAboard::Api::ApiController
    respond_to :json

    def index
      slides = AllAboard::Slide.where(id: params[:ids]).order(:position)
      respond_with slides, each_serializer: AllAboard::SlideSerializer
    end
  end
end
