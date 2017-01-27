require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CwamRails
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    preload_settings = HashWithIndifferentAccess.new(
      YAML.load(
        ERB.new(File.read("#{Dir.pwd}/config/settings.yml")).result
      )
    )
    env_preload_settings = HashWithIndifferentAccess.new(
      YAML.load(
        ERB.new(File.read("#{Dir.pwd}/config/settings/#{Rails.env}.yml")).result
      )
    )

    config.action_mailer.smtp_settings = preload_settings[:smtp].symbolize_keys
    config.action_mailer.default_url_options = { host: env_preload_settings[:host], protocol: 'http' } #, from: SETTINGS[:mail][:from] }
  end
end
