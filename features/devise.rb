gem "devise"
gem "devise-i18n"
rails_command "generate devise:install"
rails_command "generate devise User first_name last_name"
rails_command "generate migration AddRoleToUser role"

add_role_to_user_migration = Dir.children(File.join(destination_root, "db/migrate")).find do |f|
  f.end_with? "add_role_to_user.rb"
end

gsub_file File.join(destination_root, "db/migrate", add_role_to_user_migration), /add_column :users, :role, :string/,
  "add_column :users, :role, :string, default: :default"

action_mailer_config = <<-RUBY

  # Config for mailcatcher
  config.action_mailer.default_url_options = { host: "localhost", port: 3000 }
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

# Devise initializer
turbo_failure_app = <<-RUBY

class TurboFailureApp < Devise::FailureApp
  def respond
    if request_format == :turbo_stream
      redirect
    else
      super
    end
  end

  def skip_format?
    %w[html turbo_stream */*].include? request_format.to_s
  end
end
RUBY

inject_into_file "config/initializers/devise.rb",
  turbo_failure_app,
  after: "# frozen_string_literal: true\n"

gsub_file "config/initializers/devise.rb", /  # config.secret_key.*$\n/, ""
gsub_file "config/initializers/devise.rb", /  # config.pepper.*$\n/, ""

gsub_file "config/initializers/devise.rb",
  /'please-change-me-at-config-initializers-devise@example.com'/,
  "Rails.application.credentials.default_from_email"

gsub_file "config/initializers/devise.rb", /^.*config.parent_controller.*$/,
  '  config.parent_controller = "Users::DeviseController"'

gsub_file "config/initializers/devise.rb", /^.*config.navigational_formats.*$/,
  '  config.navigational_formats = ["*/*", :html, :turbo_stream]'

uncomment_lines "config/initializers/devise.rb", /config.warden do \|manager\|/

manager_config = <<-RUBY
    manager.failure_app = TurboFailureApp
  end
RUBY

inject_into_file "config/initializers/devise.rb",
  manager_config,
  after: "config.warden do |manager|\n"

rails_command "db:migrate"
rails_command "generate devise:i18n:views"

full_name_method = <<-RUBY

  def full_name
    "\#{first_name&.capitalize} \#{last_name&.upcase}".strip.presence || email.match(/^[^@]+/).to_s.capitalize
  end
RUBY

inject_into_file "app/models/user.rb",
  full_name_method,
  before: "end"

inject_into_class "app/models/user.rb", "User" do
  <<-RUBY
  extend Enumerize

  ROLES = %i[maintainer admin default].freeze

  enumerize :role, in: ROLES, predicates: true

  RUBY
end
