module AllAboard::Source::Assets
  extend ActiveSupport::Concern

  module ClassMethods
    def has_assets?
      Dir.exists?(assets_path)
    end

    def assets_path
      from_root("assets")
    end

    def has_stylesheets?
      stylesheet_paths.present?
    end

    def stylesheet_paths
      if Dir.exists?(stylesheets_full_path)
        Dir.entries(stylesheets_full_path).map do |filename|
          next if filename == "." || filename == ".."
          # Why yes, that *is* an editor-specific hack in my codebase.  Pretty
          # annoying when you break the server as it tries to load a .swp file
          # when you're editing a stylesheet.
          next if filename.ends_with?(".swp")

          sans_types = filename.split(".").first
          "stylesheets/#{sans_types}"
        end.compact
      else
        []
      end
    end

  protected

    def stylesheets_full_path
      from_root("assets", "stylesheets")
    end

    def from_root(*args)
      File.join(filesystem_path.to_s, *args)
    end
  end
end
