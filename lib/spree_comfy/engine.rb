module SpreeComfy
  class Engine < Rails::Engine
    require 'spree/core'
    require 'comfortable_mexican_sofa'
    require 'comfortable_mexican_sofa/routes/cms'

    engine_name 'spree_comfy'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end


    def self.activate

      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Spree::Admin::BaseController.send :include, ComfyAdminBaseController

      # Spree controller helpers

      spree_includes = %W{
        Spree::Core::ControllerHelpers::Auth
        Spree::Core::ControllerHelpers::Store
      }

      spree_includes << 'SpreeI18n::ControllerLocaleHelper' if defined?(SpreeI18n)

      spree_includes.each {|x|
        Comfy::Admin::BaseController.send :include, Object.const_get(x)
        Comfy::Cms::ContentController.send :include, Object.const_get(x)
        Comfy::Admin::Cms::PagesController.send :include, Object.const_get(x)
      }

      Spree::Core::ControllerHelpers.constants.each do |x|
        Comfy::Cms::ContentController.send :include, Object.const_get("Spree::Core::ControllerHelpers::#{x}")
      end

      # Comfy::Cms::ContentController.send :include, Spree::ViewContext
      # Comfy::Cms::ContentController.send :include, Spree::Core::ControllerHelpers::Common
      # Comfy::Cms::ContentController.send :include, Spree::Core::ControllerHelpers::Order
      Comfy::Cms::ContentController.send :include, Spree::Core::Engine.routes.url_helpers

      # Spree view helpers

      spree_helpers = %W{
        Spree::BaseHelper
        Spree::OrdersHelper
        SpreeComfy::Helper
      }

      spree_helpers.each {|x|
        Comfy::Cms::ContentController.send :helper, Object.const_get(x)
        Comfy::Admin::Cms::PagesController.send :helper, Object.const_get(x)
      }

      Comfy::Cms::Layout.send :include, SpreeComfy::Layout
      Spree::Admin::BaseController.send :include, SpreeComfy::Layout
      # TODO: Make it work
      Spree::Admin::BaseController.send :include, ComfortableMexicanSofa::Engine.routes.named_routes.url_helpers_module

      #Spree::Admin::BaseController.send :include, ComfyAdminBaseController
    end

    config.to_prepare &method(:activate).to_proc
  end
end
