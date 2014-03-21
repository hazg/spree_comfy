module SpreeComfy
  module Layout

    def self.included base
      base.class_eval do
        def self.app_layouts_for_select
          [ Spree::Config['layout'] ]
        end
      end
    end
  end

end
