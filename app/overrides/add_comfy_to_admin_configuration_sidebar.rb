Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'comfy_admin_comfy_menu',
  insert_bottom: '#main-sidebar',
  partial: 'spree/admin/shared/comfy_submenu'
)
