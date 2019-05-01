Deface::Override.new(
  virtual_path: 'spree/admin/shared/_main_menu',
  name: 'comfy_admin_comfy_menu',
  insert_bottom: 'nav',
  partial: 'spree/admin/shared/comfy_submenu'
)
