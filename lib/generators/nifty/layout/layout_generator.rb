require 'generators/nifty'

module Nifty
  module Generators
    class LayoutGenerator < Base
      DEFAULT_LAYOUT = 'application'
      DEFAULT_STYLE  = 'nifty_layout'

      argument :layout_name,     :type => :string, :default => DEFAULT_LAYOUT,  :banner => 'layout_name'
      argument :stylesheet_name, :type => :string, :default => DEFAULT_STYLE, :banner => 'stylesheet_name'

      class_option :erb,  :desc => 'Generate ERB  for view (default).',                 :type => :boolean
      class_option :haml, :desc => 'Generate HAML for view.',                           :type => :boolean
      class_option :css,  :desc => 'Generate CSS  for stylesheet (default for ERB).',   :type => :boolean
      class_option :sass, :desc => 'Generate SASS for stylesheet (default for HAML).',  :type => :boolean
      class_option :scss, :desc => 'Generate SCSS for stylesheet.',                     :type => :boolean

      def create_layout
        if options.haml?
          if options.css?
            template 'layout.html.haml', "app/views/layouts/#{file_name}.html.haml"
            copy_file 'stylesheet.css', "app/assets/stylesheets/#{style_name}.css"
          elsif options.scss?
            template 'layout.html.haml', "app/views/layouts/#{file_name}.html.haml"
            copy_file 'stylesheet.css.scss', "app/assets/stylesheets/#{style_name}.css.scss"
          else # --sass
            template 'layout.html.haml', "app/views/layouts/#{file_name}.html.haml"
            copy_file 'stylesheet.sass', "app/assets/stylesheets/#{style_name}.sass"
          end
        else # --erb
          if options.sass?
            template 'layout.html.erb', "app/views/layouts/#{file_name}.html.erb"
            copy_file 'stylesheet.sass', "app/assets/stylesheets/#{style_name}.sass"
          elsif options.scss?
            template 'layout.html.erb', "app/views/layouts/#{file_name}.html.erb"
            copy_file 'stylesheet.css', "app/assets/stylesheets/#{style_name}.css.scss"
          else # --css
            template 'layout.html.erb', "app/views/layouts/#{file_name}.html.erb"
            copy_file 'stylesheet.css', "app/assets/stylesheets/#{style_name}.css"
          end
        end
        copy_file 'layout_helper.rb', 'app/helpers/layout_helper.rb'
        copy_file 'error_messages_helper.rb', 'app/helpers/error_messages_helper.rb'
      end

      private

      def file_name
        layout_name.underscore
      end

      def style_name
        if layout_name != DEFAULT_LAYOUT && stylesheet_name == DEFAULT_STYLE
          file_name
        else
          stylesheet_name.underscore
        end
      end
    end
  end
end
