module SpreeComfy
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, :type => :boolean, :default => false
=begin      
      def source_paths
        [ File.join(File.dirname(__FILE__), '..', 'templates') ]
      end

      def add_layouts
        copy_file('layouts/spree_comfy.html.haml', 'app/views/layouts/spree_comfy.html.haml')
      end
=end
      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/spree_comfy\n"
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require spree/backend/spree_comfy\n"
      end

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require spree/frontend/spree_comfy\n", :before => /\*\//, :verbose => true
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', " *= require spree/backend/spree_comfy\n", :before => /\*\//, :verbose => true
      end

      def generate_routing
        route_string = <<~RUBY
          mount SpreeComfy::Engine, at: '/'
        RUBY
        route route_string
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_comfy'
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end
