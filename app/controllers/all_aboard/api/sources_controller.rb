require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class SourcesController < AllAboard::Api::ApiController
    def index
      render json: AllAboard::SourceManager.instance.sources
    end
  end
end
