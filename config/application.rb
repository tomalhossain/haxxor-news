require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module HaxxorNews
  class Application < Rails::Application

    config.generators do |g|
      g.assets false
      g.helper false
      g.view_specs = false
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
    config.active_record.raise_in_transactional_callbacks = true
  end
end
