# Title
# Deface::Override.new(
#   virtual_path: 'spree/admin/shared/_head',
#   name: 'integrate_head_title',
#   replace: 'title',
#   partial: 'spree/admin/shared/comfy_head_title'
# )

# Left menu
Deface::Override.new(
  virtual_path: 'spree/admin/shared/_main_menu',
  name: 'comfy_admin_spree_menu',
  insert_bottom: 'nav',
  partial: 'spree/admin/shared/comfy_submenu'
)

# Inside head
Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'comfy_admin_layout_spree_head',
  insert_bottom: 'head',
  partial: 'spree/admin/shared/comfy_inside_head'
)

# Footer scripts
Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'comfy_admin_layout_spree_footer',
  insert_bottom: '[data-hook="admin_footer_scripts"]',
  partial: 'spree/admin/shared/comfy_footer'
)

# Body id class
Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'comfy_admin_body_id',
  set_attributes: 'body',
  attributes: {
    id: "<%= (controller.class < Comfy::Admin::Cms::BaseController) ? 'comfy':'' %>"
  }
)

# Main > row class
Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'comfy_admin_main_class',
  set_attributes: 'main > .row',
  attributes: {
    id: "<%= (controller.class < Comfy::Admin::Cms::BaseController) ? 'cms-main' : ''%>"
  }
)

# Space for right column
Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'comfy_admin_space_for_right_column',
  set_attributes: 'main > .row #content',
  attributes: {
    class: "col-lg-10"
  }
)

# Right column
Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'comfy_admin_right_column',
  insert_bottom: 'main > .row',
  text: '<div class="col-lg-2"><%= render partial: "layouts/comfy/admin/cms/right" %>'
)

# # Flash
# Deface::Override.new(
#   virtual_path: 'spree/layouts/admin',
#   name: 'comfy_admin_flash',
#   insert_top: 'main > .row',
#   text: '<%=  render partial: "layouts/comfy/admin/cms/flash" %>'
# )

# Modal
# Deface::Override.new(
#   virtual_path: 'spree/layouts/admin',
#   name: 'comfy_admin_modal',
#   insert_top: 'main > .row',
#   text: '<%= render "comfy/admin/cms/files/modal" if @site && !@site.new_record? %>'
# )
