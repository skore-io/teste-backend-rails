require_relative 'boot'

require 'rails'
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"


Bundler.require(*Rails.groups)

module TesteBackendRails
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.stylesheets = false
      g.javascripts = false
      g.test_framework :rspec, fixture: false
    end
  end
end
