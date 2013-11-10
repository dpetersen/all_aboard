module AllAboard
  class Engine < ::Rails::Engine
    isolate_namespace AllAboard

    # See lib/all_aboard/source_manager if you modify this code.  Hopefully
    # this can be written in a more unified manner when I'm not so sick of
    # handfighting it.
    initializer 'activeservice.autoload', before: :set_autoload_paths do |app|
      app.config.autoload_paths << AllAboard::Engine.root.join("lib")

      app_source_directory = Rails.root.join("app", "sources")
      Dir.entries(app_source_directory).each do |source_name|
        next if source_name == "." || source_name == ".."

        app.config.autoload_paths << app_source_directory.join(source_name)
      end
    end

    config.generators do |g|
      g.test_framework :rspec, fixture: false
    end

    initializer 'add source asset paths', before: "append_asset_paths" do |app|
      AllAboard::SourceManager.instance.sources.each do |source|
        app.config.assets.paths << source.assets_path if source.has_assets?
      end
    end

    initializer "configure ember-rails", before: "ember_rails.setup_vendor" do
      variant = Rails.env.production? ? :production : :development
      config.ember.variant = variant

      config.handlebars.templates_root = "all_aboard/templates"
    end
  end
end
