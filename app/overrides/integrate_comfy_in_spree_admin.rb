# Title
Deface::Override.new(
  virtual_path: 'spree/shared/_head',
  name: 'integrate_head_title',
  replace: 'title',
  partial: 'spree/admin/shared/head_title'
)

# Left menu
Deface::Override.new(
  virtual_path: 'spree/admin/shared/_main_menu',
  name: 'comfy_admin_comfy_menu',
  insert_bottom: 'nav',
  partial: 'spree/admin/shared/comfy_submenu'
)

# Inside head
Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'comfy_admin_layout_head',
  insert_bottom: '[data-hook="admin_inside_head"]',
  partial: 'spree/admin/shared/comfy_inside_head'
)

Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'comfy_admin_layout_head',
  insert_bottom: '[data-hook="admin_footer_scripts"]',
  partial: 'spree/admin/shared/comfy_footer'
)