gem "devise"
rails_command "generate devise:install"
rails_command "generate devise User first_name last_name"

action_mailer_config = <<-RUBY

  # Config for mailcatcher
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = { address: "127.0.0.1", port: 1025 }
  config.action_mailer.raise_delivery_errors = false
RUBY

inject_into_file "config/environments/development.rb",
  action_mailer_config,
  after: "config.action_mailer.perform_caching = false\n"

inject_into_class "app/controllers/application_controller.rb",
  "ApplicationController",
  "  before_action :authenticate_user!\n"

gsub_file "config/initializers/devise.rb", /  # config.secret_key.*$\n/, ""
gsub_file "config/initializers/devise.rb", /  # config.pepper.*$\n/, ""
gsub_file "config/initializers/devise.rb",
  /'please-change-me-at-config-initializers-devise@example.com'/,
  "Rails.application.credentials.default_from_email"


rails_command "db:migrate"
rails_command "generate devise:views"
