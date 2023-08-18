# frozen_string_literal: true

APP_NAME = app_name

def source_paths
  [__dir__]
end


template "Gemfile.tt", force: true

apply "config/template.rb"
apply "bin/template.rb"
apply "app/template.rb"

apply "_addons/devise/template.rb"
