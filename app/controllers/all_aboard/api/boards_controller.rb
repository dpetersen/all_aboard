require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class BoardsController < AllAboard::Api::ApiController
    def index
      render json: AllAboard::Board.all, each_serializer: AllAboard::BoardSerializer
    end
  end
end
