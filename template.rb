# frozen_string_literal: true

APP_NAME = app_name

def source_paths
  [__dir__]
end

DEVISE = true

template "Gemfile.tt", force: true

apply "bin/template.rb"
apply "app/template.rb"

apply "_addons/simple_form/template.rb"
apply "_addons/devise/template.rb" if DEVISE
apply "db/template.rb"

apply "config/template.rb"

after_bundle do
  rails_command "db:migrate"
  rails_command "db:seed"
  rails_command "app:template LOCATION=../components_templates/template.rb"

  say_status :info, "Setup complete 🚀"
end
