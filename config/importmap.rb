# frozen_string_literal: true

after_bundle do
  insert_into_file "config/importmap.rb", after: 'pin_all_from "app/javascript/controllers", under: "controllers"\n'do
    <<~RUBY
      pin_all_from "app/javascript/components", under: "components"
    RUBY
  end
end
