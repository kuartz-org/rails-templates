# frozen_string_literal: true

gem "devise"
gem "devise-i18n"
gem "devise_invitable"

directory "_addons/devise/views/devise", "app/views/devise"
template "_addons/devise/views/layouts/devise.html.slim.tt", "app/views/layouts/devise.html.slim"

inject_into_class "app/controllers/application_controller.rb",
  "ApplicationController",
  "  before_action :authenticate_user!\n"

after_bundle do
  generate "devise:install"
  generate "devise User first_name last_name role"
  generate "devise_invitable:install"
  generate "devise_invitable User"
  template "_addons/devise/models/user.rb", "app/models/user.rb", force: true
end
