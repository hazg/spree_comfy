module Spree
  module BaseHelper
    def comfy_snippet(name)
      if snippet = Comfy::Cms::Snippet.find_by_identifier(name)
        return snippet.content.html_safe
      end
      false
    end

  end
end
