module SpreeComfy
  module AdminLayout

    def self.included base
      #'/spree/layouts/admin'
      # -> {
      #   '/spree/layouts/admin'
      #   false
      # }
      base.class_eval do
        def infer_layout
          if params[:layout] == "false"
            false
          else
            '/spree/layouts/admin'
          end
        end
      end
    end
  end

end
