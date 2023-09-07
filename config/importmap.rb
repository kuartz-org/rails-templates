# frozen_string_literal: true

insert_to_file "config/importmap.rb", after: 'pin_all_from "app/javascript/controllers", under: "controllers"'do
  <<~RUBY
    pin_all_from "app/javascript/components", under: "components"
  RUBY
end
