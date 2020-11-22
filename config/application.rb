require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module PaysharesdHayashiApi
  class Application < Rails::Application

    # middlewarezez
    unless ENV["DISABLE_RATE_LIMIT"] == "true"
      config.middleware.use Rack::Attack
    end

    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        
        resource '*',
          :headers => :any,
          :methods => [:get, :post, :delete, :put, :options, :head, :patch]
      end
    end

    require "#{config.root}/lib/request_metrics"
    config.middleware.insert_before ActionDispatch::ShowExceptions,
      RequestMetrics, Metriks::Registry.default

    require "#{config.root}/lib/problem_renderer"
    config.exceptions_app = ProblemRenderer

    # custom configs

    config.paysharesd_url = ENV["PAYSHARESD_URL"]
    raise "PAYSHARESD_URL environment variable unset" if config.paysharesd_url.blank?
    #

    if ENV["CACHE_URL"].present?
      servers = ENV["CACHE_URL"].split(",")
      config.cache_store = Memcached::Rails.new(servers)
    else
      config.cache_store = :memory_store
    end

    config.autoload_paths << "#{config.root}/lib"
    config.autoload_paths << "#{config.root}/app/errors"
    config.autoload_paths << "#{config.root}/app/serializers"

    config.generators do |g|
      g.orm             :active_record
      g.test_framework  :rspec, fixture: false, views: false
      g.template_engine false
      g.stylesheets     false
      g.javascripts     false
      g.helper          false
    end

  end
end
