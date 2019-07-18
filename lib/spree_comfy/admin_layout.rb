module SpreeComfy
  module AdminLayout
    extend ActiveSupport::Concern

    included do
      layout :spree_comfy_layout
    end

    def spree_comfy_layout
      if params[:layout] == "false" || request.xhr?
        false
      else
        '/spree/layouts/admin'
      end
    end

  end

end
