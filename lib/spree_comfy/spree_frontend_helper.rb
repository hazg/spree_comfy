module SpreeComfy
  module SpreeFrontendHelper
    extend ActiveSupport::Concern

    included do
      before_action :spree_comfy_load_site, except: [:jump]
      before_action :spree_comfy_load_page, except: [:jump]
    end

    private
    # Attempting to populate @cms_page and @cms_layout instance variables so they
    # can be used in view helpers/partials
    def load_cms_page

      # Ability to override Spree pages (like /products).
      params[:cms_path] = request.path.gsub(/^\//, '')

      unless find_cms_page_by_full_path("/#{params[:cms_path]}")
        if find_cms_page_by_full_path("/404")
          render_page(:not_found)
        else
          nil
        end
      end
    end

    # Getting page and setting content_cache and fragments data if we need to
    # serve translation data
    def find_cms_page_by_full_path(full_path)
      @cms_page = @cms_site.pages.published.find_by!(full_path: full_path)

      @cms_page.translate!
      @cms_layout = @cms_page.layout
      @page = @cms_page
      @cms_page

    rescue ActiveRecord::RecordNotFound
      nil
    end

    def spree_comfy_load_page
      load_cms_page
      @page = @cms_page
    end

    def spree_comfy_load_site
      return @cms_site if @cms_site
      @cms_site ||= if params[:site_id]
        ::Comfy::Cms::Site.find_by_id(params[:site_id])
      else
        ::Comfy::Cms::Site.find_site(request.host_with_port.downcase, request.fullpath)
      end

      if @cms_site
        if @cms_site.path.present? && !params[:site_id]
          if params[:cms_path] && params[:cms_path].match(/\A#{@cms_site.path}/)
            params[:cms_path].gsub!(/\A#{@cms_site.path}/, '')
            params[:cms_path] && params[:cms_path].gsub!(/\A\//, '')
          else
            raise ActionController::RoutingError.new('Site Not Found')
          end
        end
        I18n.locale = @cms_site.locale
      else
        I18n.locale = I18n.default_locale
        raise ActionController::RoutingError.new('Site Not Found')
      end
      @cms_site
    end
  end
end