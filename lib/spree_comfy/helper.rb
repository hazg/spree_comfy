module SpreeComfy
  module Helper
    
    def method_missing(method_id, *arguments, &block)
      if Rails.application.routes.url_helpers.methods.include?(method_id)
        Rails.application.routes.url_helpers.send method_id, arguments
      else
        super
      end
    end

    def current_currency
        Spree::Config[:currency]
    end
    #helper_method :current_currency
    
    def try_spree_current_user
      spree.try_spree_current_user
    end

    def set_locale_path
      '/locale/set'
    end

    def root_path
      spree.root_path
    end

  end
end
