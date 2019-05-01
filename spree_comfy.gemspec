# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spree_comfy/version"

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_comfy'
  s.version     = SpreeComfy::VERSION
  s.summary     = 'comfortable-mexican-sofa integration'
  s.description = 'Add comfortable mexican sofa CMS to spree commerce'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Aleksander Aleksandrov'
  s.email     = 'ya@hazg.net'
  s.homepage  = 'http://github.com/hazg/spree_comfy'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree'#, '~> 4.0'
  s.add_dependency 'comfortable_mexican_sofa', '~> 2.0.0'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
