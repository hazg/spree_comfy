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
      
      Cms::ContentController.send :include, Rails.application.routes.url_helpers
      Cms::ContentController.send :include, Spree::ViewContext
      Cms::ContentController.send :include, Spree
      Cms::ContentController.send :include, Spree::Core::ControllerHelpers
      Cms::ContentController.send :include, SpreeI18n::ControllerLocaleHelper if defined?(SpreeI18n)

      Cms::ContentController.send :helper, Spree::BaseHelper
      Cms::ContentController.send :helper, Spree::OrdersHelper
      Cms::ContentController.send :helper, Spree::StoreHelper
      
      Cms::ContentController.send :helper, SpreeComfy::Helper
      Cms::Layout.send :include, SpreeComfy::Layout

    end

    config.to_prepare &method(:activate).to_proc
  end
end
