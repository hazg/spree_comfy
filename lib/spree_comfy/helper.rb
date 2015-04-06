module SpreeComfy
  module Helper
    
    def comfy_snippet(name)
      if snippet = Comfy::Cms::Snippet.find_by_identifier(name)
        return snippet.content.html_safe
      end
      false
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
