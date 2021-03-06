require_dependency "all_aboard/source"

module AllAboard
  class SourceManager
    def self.instance
      @instance ||= new
    end

    def initialize
      @sources = []
      @sources_loaded = false
    end

    def sources
      load_sources unless @sources_loaded
      @sources
    end

    def find_by_id(id)
      sources.detect { |source| source.id.to_s == id.to_s }
    end

  protected

  # This probably looks weird to you, and you're right.  Unfortunately, (in
  # development mode only) I kept losing my reference to the sources when the
  # SourceManager got reloaded, so I'm doing this loading a little more...
  # creatively.
  #
  # TODO: The duplication here and in the engine initializer isn't great, and
  # I'll probably forget to modify this if I ever try making sources
  # gemifiable.
    def load_sources
      app_source_directory = Rails.root.join("app", "sources")
      Dir.entries(app_source_directory).each do |source_name|
        next if source_name == "." || source_name == ".."

        klass = source_name.classify.constantize
        klass.filesystem_path(app_source_directory.join(source_name))
        @sources << klass
      end

      @sources_loaded = true
    end
  end
end
