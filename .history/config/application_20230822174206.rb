# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InstagramClone
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
config.generators do |g|
  g.orm :active_record
  g.test_framework :rspec, fixtures: false
end

ThinkingSphinx::Index.define :account, with: :active_record do
  indexes :first_name, type: :string
  indexes :last_name, type: :string
  indexes :username, type: :string
  indexes :description, type: :string
end
