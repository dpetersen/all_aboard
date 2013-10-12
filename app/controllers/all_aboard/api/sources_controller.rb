require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class SourcesController < AllAboard::Api::ApiController
    def index
      render json: sources_as_json
    end

  protected

    def sources_as_json
      AllAboard::SourceManager.instance.sources.each_with_object([]) do |source, a|
        h = {
          id: source.name,
          name: source.name.gsub(/Source$/, "")
        }
        a << h
      end
    end
  end
end
