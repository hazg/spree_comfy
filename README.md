SpreeComfy
==========

Content management system based on [comfortable-mexican-sofa](https://github.com/comfy/comfortable-mexican-sofa) for [spree commerce](https://github.com/spree/spree). This is not a spree_static_content, it is a full-fledged CMS with image upload, page templates and a tree structure of content.


* for spree [3-6-stable](https://github.com/spree/spree/tree/3-6-stable) branch


Before installation
-------------------
Install comfy to your application, make new site.


Installation
------------

Add spree_comfy to your Gemfile:

```ruby
gem 'comfortable_mexican_sofa'
gem 'spree_comfy', github: 'hazg/spree_comfy'
```

In initializers/comfortable-mexican-sofa.rb
```ruby
config.reveal_cms_partials = true
```
... to see additional menu items in cms admin area

config/routes.rb example
```ruby
mount Spree::Core::Engine, at: '/'
mount SpreeComfy::Engine, at: '/'

comfy_route :cms_admin, path: '/admin' # Same as spree admin path
comfy_route :cms, path: '/', sitemap: false
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_comfy:install
```

Use
---
Render snippets:
```slim
= comfy_snippet('snippet-identifier')
```
Creating navigation:
add category (for ex. "In top menu"), add {{ cms:page:menu_name:string }} to pages layout.

```slim
ul#top-menu
  - cms_site.pages.for_category('In top menu').each do |page|
    li
      - if not (label = cms_block_content('menu_name', page)).empty?
        a href=page.full_path =label
      - else
        a href=page.full_path =page.label
```

Auth with devise
----------------

https://github.com/hazg/spree_comfy_auth_devise

Copyright (c) 2014-2019 Aleksandr Aleksandrov, released under the New BSD License
