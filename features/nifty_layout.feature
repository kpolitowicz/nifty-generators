Feature: Nifty Layout Generator
  In order to have a layout
  As a rails developer
  I want to generate a simple layout

  Background: Create a new rails app
    Given a new Rails app

  Scenario: Generate normal application layout
    When I run "rails g nifty:layout -f"
    Then I should see "stylesheet_link_tag "nifty_layout"" in file "app/views/layouts/application.html.erb"
    Then I should see "h(page_title" in file "app/helpers/layout_helper.rb"
    And I should see the following files
      | app/helpers/layout_helper.rb            |
      | app/helpers/error_messages_helper.rb    |
      | app/assets/stylesheets/nifty_layout.css |

  Scenario: Generate named layout without stylesheet name
    When I run "rails g nifty:layout FooBar -f"
    Then I should see "stylesheet_link_tag "foo_bar"" in file "app/views/layouts/foo_bar.html.erb"
    And I should see the following files
      | app/helpers/layout_helper.rb            |
      | app/helpers/error_messages_helper.rb    |
      | app/assets/stylesheets/foo_bar.css      |

  Scenario Outline: Generate named layout and stylesheet with options
    When I run "rails g nifty:layout FooBar NiftyStyle <options> -f"
    Then I should see "stylesheet_link_tag "nifty_style" in file "app/views/layouts/foo_bar.html.<layout_version>"
    And I should see file "app/assets/stylesheets/nifty_style.<stylesheet_version>"
    And I should see file "app/helpers/layout_helper.rb"

    Scenarios:
      | options       | layout_version | stylesheet_version |
      | --erb --sass  | erb            | sass               |
      | --haml        | haml           | sass               |
      | --scss        | erb            | css.scss           |
      | --haml --scss | haml           | css.scss           |
