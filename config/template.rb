# frozen_string_literal: true

copy_file "config/sidekiq.yml"

template "config/tailwind.config.js.tt"

apply "config/application.rb"
apply "config/environments/development.rb"
apply "config/environments/production.rb"
apply "config/importmap.rb"
apply "config/initializers/inflections.rb"

directory "config/locales"

after_bundle do
  template "config/routes.rb", force: true
end
