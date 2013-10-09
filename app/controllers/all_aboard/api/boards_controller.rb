require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class BoardsController < AllAboard::Api::ApiController
    def index
      render json: AllAboard::Board.all, each_serializer: AllAboard::BoardSerializer
    end

    def create
      board = AllAboard::Board.create!(board_params)
      render json: board, serializer: AllAboard::BoardSerializer
    end

  protected

    def board_params
      params.require(:board).permit(:name)
    end
  end
end
