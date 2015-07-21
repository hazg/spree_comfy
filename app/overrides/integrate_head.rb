Deface::Override.new(
  virtual_path: 'spree/shared/_head',
  name: 'integrate_head_title',
  replace: 'title',
  partial: 'spree/admin/shared/head_title'
)
