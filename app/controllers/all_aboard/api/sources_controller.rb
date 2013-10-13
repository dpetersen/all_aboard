require_dependency "all_aboard/api/api_controller"

module AllAboard::Api
  class SourcesController < AllAboard::Api::ApiController
    respond_to :json

    def index
      respond_with({
        sources: sources,
        configurable_attributes: all_configurable_attributes,
        perspectives: all_perspectives
      })
    end

    def show
      source = sources.detect { |s| s.id == params[:id] }

      respond_with({
        source: source,
        configurable_attributes: source.configurable_attributes,
        perspectives: source.perspectives
      })
    end

  protected

    def sources
      AllAboard::SourceManager.instance.sources
    end

    def all_perspectives
      sources.map(&:perspectives).flatten
    end

    def all_configurable_attributes
      sources.map(&:configurable_attributes).flatten
    end
  end
end
