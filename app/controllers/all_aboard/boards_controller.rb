require_dependency "all_aboard/application_controller"

module AllAboard
  class BoardsController < ApplicationController
    def index
      render nothing: true, layout: "all_aboard/application"
    end
  end
end
