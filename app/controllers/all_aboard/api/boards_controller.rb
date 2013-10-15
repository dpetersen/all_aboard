require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class BoardsController < AllAboard::Api::ApiController
    respond_to :json

    def index
      respond_with(
        AllAboard::Board.all,
        each_serializer: AllAboard::BoardSerializer
      )
    end

    def create
      board = AllAboard::Board.create!(board_params)
      respond_with board, location: api_board_path(board)
    end

    def show
      respond_with AllAboard::Board.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render nothing: true, status: :not_found
    end

  protected

    def board_params
      params.require(:board).permit(:name)
    end
  end
end
