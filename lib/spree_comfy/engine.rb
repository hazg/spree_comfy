module SpreeComfy
  class Engine < Rails::Engine
    require 'spree/core'
    
    isolate_namespace Spree
    engine_name 'spree_comfy'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
      
      Comfy::Cms::ContentController.send :include, Rails.application.routes.url_helpers
      Comfy::Cms::ContentController.send :include, Spree::ViewContext
      Comfy::Cms::ContentController.send :include, Spree
      Comfy::Cms::ContentController.send :include, Spree::Core::ControllerHelpers
      Comfy::Cms::ContentController.send :include, Spree::Core::ControllerHelpers::Order
      Comfy::Cms::ContentController.send :include, Spree::Core::ControllerHelpers::Search
      Comfy::Cms::ContentController.send :include, Spree::Core::ControllerHelpers::Common
      Comfy::Cms::ContentController.send :include, SpreeI18n::ControllerLocaleHelper if defined?(SpreeI18n)

      Comfy::Cms::ContentController.send :helper, Spree::BaseHelper
      Comfy::Cms::ContentController.send :helper, Spree::OrdersHelper
      Comfy::Cms::ContentController.send :helper, Spree::StoreHelper

      Comfy::Cms::ContentController.send :helper, SpreeComfy::Helper
      Comfy::Cms::Layout.send :include, SpreeComfy::Layout

    end

    config.to_prepare &method(:activate).to_proc
  end
end
