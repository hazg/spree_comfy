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
      Spree::Admin::BaseController.send :include, SpreeComfy::SpreeAdminHelper

      Comfy::Cms::Layout.send :include, SpreeComfy::Layout
      Comfy::Admin::Cms::BaseController.send :include, SpreeComfy::AdminLayout
      
    end

    config.to_prepare &method(:activate).to_proc
  end
end
