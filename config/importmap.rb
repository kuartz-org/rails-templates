# frozen_string_literal: true

after_bundle do
  append_to_file "config/importmap.rb", <<~RUBY
    pin_all_from "app/javascript/components", under: "components"
  RUBY
end
