module SpreeComfy
  module Layout

    def self.included base
      base.class_eval do
        def self.app_layouts_for_select(view_paths)
          [Spree::Config['layout']] +
          view_paths.map(&:to_s).select { |path| path.start_with?(Rails.root.to_s) }.flat_map do |full_path|
            Dir.glob("#{full_path}/layouts/**/*.html.*").collect do |filename|
              filename.gsub!("#{full_path}/layouts/", "")
              filename.split("/").last[0...1] == "_" ? nil : filename.split(".").first
            end.compact.sort
          end.compact.uniq.sort
        end
      end


    end
  end

end
