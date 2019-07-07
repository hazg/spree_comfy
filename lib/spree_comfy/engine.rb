module SpreeComfy
  class Engine < Rails::Engine
    require 'spree/core'
    require 'comfortable_mexican_sofa'

    engine_name 'spree_comfy'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end


    def self.activate

      Spree::Core::ControllerHelpers.constants.each do |x|
        Comfy::Cms::BaseController.send :include, obj =
          Object.const_get("Spree::Core::ControllerHelpers::#{x}")
      end

      Comfy::Cms::BaseController.send :helper, Spree::BaseHelper
      Comfy::Cms::BaseController.send :helper, SpreeComfy::ComfyHelper

      Comfy::Admin::Cms::BaseController.send :include, Spree::Core::ControllerHelpers::Auth
      Comfy::Admin::Cms::BaseController.send :include, Spree::Core::ControllerHelpers::Store

      Comfy::Admin::BaseController.send :include, Spree::Core::ControllerHelpers::Auth
      Comfy::Admin::BaseController.send :include, Spree::Core::ControllerHelpers::Store

      Spree::Admin::BaseController.send :include, SpreeComfy::SpreeBackendHelper
      Spree::BaseController.send :include, SpreeComfy::SpreeFrontendHelper
      # Spree::BaseController.send :include, ComfortableMexicanSofa::RenderMethods

      Comfy::Cms::Layout.send :include, SpreeComfy::Layout
      Spree::BaseController.send :include, SpreeComfy::SpreeFrontendHelper
      Comfy::Cms::ContentController.send :include, SpreeComfy::SpreeFrontendHelper

      require 'spree_comfy/spree_base_helper_overrides'

    end

    config.to_prepare &method(:activate).to_proc
  end
end
