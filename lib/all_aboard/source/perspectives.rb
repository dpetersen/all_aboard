module AllAboard::Source::Perspectives
  extend ActiveSupport::Concern

  module ClassMethods
    def perspective(filename, options = {})
      @perspectives ||= []
      @perspectives << AllAboard::Source::Perspective.new(
        id, filename, options[:name], options[:description]
      )
    end

    def perspectives
      return [] if @perspectives.nil?

      load_templates
      @perspectives
    end

  protected

    # Loading these later, after the SourceManager will have set the
    # filesystem_path on each Source.
    def load_templates
      return if @templates_loaded

      template_path = filesystem_path.join("templates").to_s
      Dir[template_path + "/*"].each do |template_full_path|
        template_relative_path = template_full_path.split("/").last
        file_elements = template_relative_path.split(".")
        basename = file_elements.first
        width, height = file_elements.second.split("x")
        perspective = @perspectives.detect { |p| p.filename.to_s == basename }

        perspective.add_template(width.to_i, height.to_i)
      end

      @templates_loaded = true
    end
  end
end
