Deface::Override.new(
                     :virtual_path => 'spree/admin/shared/_menu',
                     :name => 'custom-admin-tab',
                     :insert_bottom => "[data-hook=admin_tabs]",
                     :text => "<%= tab(:pages, :url => '/cms_admin', :icon => 'icon-sitemap fa-sitemap') %>"
)

