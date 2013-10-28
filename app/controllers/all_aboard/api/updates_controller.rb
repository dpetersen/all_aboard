require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class UpdatesController < AllAboard::Api::ApiController
    respond_to :json

    def index
      board = AllAboard::Board.find(params[:board_id])
      respond_with(payloads: all_payloads_for(board))
    end

  protected

    def all_payloads_for(board)
      assignments = board.slides.map(&:perspective_assignments).flatten

      assignments.map do |assignment|
        {
          id: assignment.data_key,
          value: assignment.current_data
        }
      end
    end
  end
end
