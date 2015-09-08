module Spree
  module BaseHelper

    def comfy_snippet(name)
      if snippet = Comfy::Cms::Snippet.find_by_identifier(name)
        return snippet.content.html_safe
      end
      false
    end
    
    def cms_site
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
