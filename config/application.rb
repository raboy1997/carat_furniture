require_relative 'boot'

require 'rails/all'


Bundler.require(*Rails.groups)

module DiplomSite
  class Application < Rails::Application
    config.assets.initialize_on_precompile = false
  end
end
