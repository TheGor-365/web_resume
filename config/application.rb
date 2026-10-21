require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module WebResume
  class Application < Rails::Application
    config.load_defaults 7.0

    config.i18n.default_locale = :ru
    config.i18n.available_locales = %i[ru en]
    config.i18n.fallbacks = true
  end
end
