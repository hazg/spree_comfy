module SpreeComfy
  module Helper

    #
    # TODO: Rewrite. Wrong way.
    #
    def method_missing(method_id, *arguments, &block)
      if method_id.to_s.end_with?('_path', '_url') and Rails.application.routes.url_helpers.methods.include?(method_id)
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
