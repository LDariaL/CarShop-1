require_relative "boot"

require "rails/all"


Bundler.require(*Rails.groups)

module RailsCourse
  class Application < Rails::Application
    config.load_defaults 7.0
    config.i18n.default_locale = :ru

    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
