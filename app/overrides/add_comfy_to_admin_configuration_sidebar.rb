Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'comfy_admin_configurations_menu',
  insert_bottom: '#main-sidebar',
  partial: 'spree/admin/shared/comfy_sidebar_menu'
)
