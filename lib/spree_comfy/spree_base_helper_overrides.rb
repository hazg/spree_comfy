Spree::BaseHelper.module_eval do
  def meta_data
    object = instance_variable_get('@' + controller_name.singularize)

    meta = {}

    if object.is_a? ApplicationRecord
      meta[:keywords] = object.meta_keywords if object[:meta_keywords].present?
      meta[:description] = object.meta_description if object[:meta_description].present?
    end

    if meta[:description].blank? && object.is_a?(Spree::Product)
      meta[:description] = truncate(strip_tags(object.description), length: 160, separator: ' ')
    end

    if meta[:keywords].blank? || meta[:description].blank?

      if @page.present?
        # Get meta from Comfy
        @title = @page.label
        keywords = cms_fragment_content('meta_keywords', @page)
        description = cms_fragment_content('meta_description', @page)
        meta.reverse_merge!(keywords: keywords,
          description: description)
      else
        meta.reverse_merge!(keywords: current_store.meta_keywords,
                          description: current_store.meta_description)
      end
    end
    meta
  end
end