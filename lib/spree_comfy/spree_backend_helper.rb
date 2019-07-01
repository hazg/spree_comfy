module SpreeComfy
  module SpreeBackendHelper
    extend ActiveSupport::Concern

    included do
     before_action :spree_comfy_load_admin_site, except: [:jump]
    end

    def spree_comfy_load_admin_site
      id_param = params[:site_id] || session[:site_id]
      if (@site = ::Comfy::Cms::Site.find_by(id: id_param) || ::Comfy::Cms::Site.first)
        session[:site_id] = @site.id
      else
        I18n.locale = ComfortableMexicanSofa.config.admin_locale || I18n.default_locale
        flash[:danger] = I18n.t("comfy.admin.cms.base.site_not_found")
        return redirect_to("#{Spree::Config.admin_path}/sites/new")
      end
    end

  end
end
