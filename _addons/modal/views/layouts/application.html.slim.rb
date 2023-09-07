# frozen_string_literal: true

insert_into_file "app/views/layouts/application.html.slim", before: /  body/ do
  <<~RUBY.indent(2)
    = render "layouts/modal"
  RUBY
end
