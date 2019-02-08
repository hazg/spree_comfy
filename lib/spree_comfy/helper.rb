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
    
    #def try_spree_current_user
    #  spree.try_spree_current_user
    #end
    # proxy method to *possible* spree_current_user method
    # Authentication extensions (such as spree_auth_devise) are meant to provide spree_current_user
    def try_spree_current_user
      # This one will be defined by apps looking to hook into Spree
      # As per authentication_helpers.rb
      if respond_to?(:spree_current_user)
        spree_current_user
      # This one will be defined by Devise
      elsif respond_to?(:current_spree_user)
        current_spree_user
      end
    end

    def set_locale_path
      '/locale/set'
    end

    def root_path
      spree.root_path
    end

  end
end
