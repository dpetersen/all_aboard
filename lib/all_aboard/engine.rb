module AllAboard
  class Engine < ::Rails::Engine
    isolate_namespace AllAboard

    config.generators do |g|
      g.test_framework :rspec, fixture: false
    end

    initializer "configure ember-rails", before: "ember_rails.setup_vendor" do
      variant = Rails.env.production? ? :production : :development
      config.ember.variant = variant

      config.handlebars.templates_root = "all_aboard/templates"
    end
  end
end
