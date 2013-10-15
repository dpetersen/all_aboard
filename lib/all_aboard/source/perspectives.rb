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

      templates_path = filesystem_path.join("templates").to_s
      each_template_for_path(templates_path) do |template_full_path|
        load_template(template_full_path)
      end

      @templates_loaded = true
    end

    def each_template_for_path(templates_path)
      Dir[templates_path + "/*"].sort.each do |template_full_path|
        yield template_full_path
      end
    end

    def load_template(template_full_path)
      # TODO - this variable extraction could go in a class.  The only problem
      # is that adding filesystem awareness to a bunch of classes will make
      # testing that more painful.
      template_relative_path = template_full_path.split("/").last
      file_elements = template_relative_path.split(".")
      basename = file_elements.first
      width, height = file_elements.second.split("x")
      perspective = @perspectives.detect { |p| p.filename.to_s == basename }
      markup = File.read(template_full_path)

      perspective.add_template(width.to_i, height.to_i, markup)
    end
  end
end
