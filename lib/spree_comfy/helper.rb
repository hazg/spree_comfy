module SpreeComfy
  module Helper
    
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

  module AdminHelper
    def self.included(base)
      base.before_action :load_admin_site
    end
    

    def load_admin_site
      if @site = ::Comfy::Cms::Site.find_by_id(params[:site_id] || session[:site_id]) || ::Comfy::Cms::Site.first
        session[:site_id] = @site.id
      else
        I18n.locale = ComfortableMexicanSofa.config.admin_locale || I18n.default_locale
        flash[:danger] = I18n.t('comfy.admin.cms.base.site_not_found')
        return redirect_to(new_comfy_admin_cms_site_path)
      end
    end
  end
end
