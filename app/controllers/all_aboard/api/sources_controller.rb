require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class SourcesController < AllAboard::Api::ApiController
    respond_to :json

    def index
      respond_with AllAboard::SourceManager.instance.sources
    end
  end
end
