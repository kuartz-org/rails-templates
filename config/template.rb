# frozen_string_literal: true

copy_file "config/sidekiq.yml"

apply "config/application.rb"
apply "config/environments/development.rb"
apply "config/environments/production.rb"
apply "config/tailwin_config.js.rb"
