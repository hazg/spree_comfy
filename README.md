SpreeComfy
==========

Add comfortable-mexican-sofa to spree commerce

Installation
------------

Add spree_comfy to your Gemfile:

```ruby
gem 'spree_comfy', github: 'hazg/spree_comfy'
```

In initializers/comfortable-mexican-sofa.rb
```ruby
config.reveal_cms_partials = true
```
... to see additional menu items in cms admin area

config/routes.rb example
```ruby
mount Spree::Core::Engine, :at => '/'
mount SpreeComfy::Engine, :at => '/'

comfy_route :cms_admin, :path => '/cms_admin'
comfy_route :cms, :path => '/', :sitemap => false
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_comfy:install
```

Use
---
Render snippets:
```erb
<%= comfy_snippet('snippet-identifier') %>
```
Creating navigation:
Add category (for ex. "In top menu")
Add {{ cms:page:menu_name:string }} to pages layout.
```slim
ul#top-menu
  - cms_site.pages.for_category('In top menu').each do |page|
  li
    - if not (label = cms_block_content('menu_name', page)).empty?
      a href=page.slug =label
    - else
      a href=page.slug =page.label
```

Auth with devise
----------------

https://github.com/hazg/spree_comfy_auth_devise



Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_comfy/factories'
```

Copyright (c) 2014 [name of extension creator], released under the New BSD License
