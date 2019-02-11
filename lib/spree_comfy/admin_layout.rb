module SpreeComfy
  module AdminLayout

    def self.included base
      base.class_eval do
        layout '/spree/layouts/admin'
      end


    end
  end

end
