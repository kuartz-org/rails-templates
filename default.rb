# gem 'simple_form', github: 'heartcombo/simple_form'

# gem_group :development, :test do
#   gem 'pry-byebug'
#   gem 'pry-rails'
# end

welcome_message = <<-TXT

        ::::::::::::::         ::::.
      :+**************+-     =####=.
    .+***=----------=*+:   :*###+.
   =***+.            .   :*###*:
 .+***-                .+###*:
  -+**+-.            .=####*.
    -+***-.         :########:
      -+***=.        :+= :*###+.
        -+***=..=*=.       =####-
          :+******+:        :*###*.
            :+**+:            -####=
              ..               .::::.
TXT

say welcome_message

# BEGIN DEVISE ================================================================
say_status :info, "📦 Installing Devise..."

gem "devise"
rails_command "generate devise:install"
rails_command "generate devise User first_name last_name"
# config/environments/development.rb
# config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

code_line = <<-RUBY

  # Config for mailcatcher
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = { address: "127.0.0.1", port: 1025 }
  config.action_mailer.raise_delivery_errors = false
RUBY

inject_into_file "config/environments/development.rb",
  code_line,
  after: "config.action_mailer.perform_caching = false\n"

inject_into_file "app/controllers/application_controller.rb",
  "before_action :authenticate_user!\n",
  after: "class ApplicationController < ActionController::Base\n"

rails_command "db:migrate"

say_status :info, "✅ Devise setup ok"
# END DEVISE ==================================================================
