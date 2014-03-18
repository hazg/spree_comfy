SpreeComfy
==========

Add comfortable-mexican-sofa to spree commerce

Installation
------------

Add spree_comfy to your Gemfile:

```ruby
gem 'spree_comfy'
```

In initializers/comfortable-mexican-sofa.rb
```ruby
config.reveal_cms_partials = true
```
... to see additional menu items in cms admin area

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_comfy:install
```

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
