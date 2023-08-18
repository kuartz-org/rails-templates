gem "devise"
gem "devise-i18n"

inject_into_class "app/controllers/application_controller.rb",
  "ApplicationController",
  "  before_action :authenticate_user!\n"

after_bundle do
  generate "devise:install"
  rails_command "generate devise User first_name last_name"
end
