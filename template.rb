# frozen_string_literal: true

APP_NAME = app_name

def source_paths
  [__dir__]
end

DEVISE = true
CLEVER_CLOUD = true
CHART_JS = true
TOM_SELECT = true
FLATPICKR = true
TAILWIND_COLOR = true
ACTION_POLICY = true

template "Gemfile.tt", force: true
template "Procfile.dev.tt", force: true

apply "bin/template.rb"
apply "app/template.rb"

apply "_addons/modal/template.rb"
apply "_addons/simple_form/template.rb"
apply "_addons/devise/template.rb" if DEVISE
apply "_addons/clever_cloud/template.rb" if CLEVER_CLOUD
apply "_addons/chart_js/template.rb" if CHART_JS
apply "_addons/tom_select/template.rb" if TOM_SELECT
apply "_addons/flatpickr/template.rb" if FLATPICKR
apply "_addons/tailwind_color/template.rb" if TAILWIND_COLOR
apply "_addons/action_policy/template.rb" if ACTION_POLICY

apply "db/template.rb"
apply "config/template.rb"

after_bundle do
  rails_command "db:create"
  rails_command "db:migrate"
  rails_command "db:seed"
  rails_command "app:template LOCATION=../components_templates/template.rb"

  git :init
  git add: '.'
  git commit: "-a -m 'Complete setup from template'"
  say_status :info, "Setup complete 🚀"
end
