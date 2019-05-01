Deface::Override.new(
  virtual_path: 'spree/admin/shared/sub_menu/_configuration',
  name: 'comfy_admin_comfy_menu',
  insert_after: '[data-hook=admin_configurations_sidebar_menu]',
  partial: 'spree/admin/shared/comfy_submenu'
)
