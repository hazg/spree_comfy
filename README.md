SpreeComfy
==========

[![Build Status](https://travis-ci.org/hazg/spree_comfy.svg?branch=master)](https://travis-ci.org/hazg/spree_comfy)

Content management system based on [comfortable-mexican-sofa](https://github.com/comfy/comfortable-mexican-sofa) for [spree commerce](https://github.com/spree/spree). This is not a spree_static_content, it is a full-fledged CMS with image upload, page templates and a tree structure of content.


spree >= [3-6-stable](https://github.com/spree/spree/tree/3-6-stable)


Installation
------------

Gemfile:
```ruby
# order is important
gem 'spree'
gem 'comfortable_mexican_sofa'
gem 'spree_comfy', branch: 'integrated', github: 'hazg/spree_comfy'
gem 'spree_auth_devise'
```

Run bundler:
```bash
bundle
```

Generate installs:
```bash
bundle exec rails generate comfy:cms
bundle exec rails generate spree_comfy:install
bundle exec rails generate spree:install --user_class=Spree::User
```

Now take a look inside your config/routes.rb file. You'll see where routes attach for the admin area and content serving. Make sure that content serving route appears as a very last item or it will make all other routes to be inaccessible.

```ruby
mount Spree::Core::Engine, at: '/'
mount SpreeComfy::Engine, at: '/'

comfy_route :cms_admin, path: '/admin'
comfy_route :cms, path: '/', sitemap: false
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
