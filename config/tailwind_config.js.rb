# frozen_string_literal: true

insert_into_file 'config/tailwin_config.js', before: "'./app/views/**/*.{erb,haml,html,slim}'"/ do
  <<~JS.indent(4)
    './app/components/**/*.{rb,erb,html,slim}',
    './test/components/previews/**/*.{erb,html,slim}',
  JS
end
