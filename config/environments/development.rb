# frozen_string_literal: true

inject_into_file "config/environments/development.rb", after: "config.action_mailer.perform_caching = false\n" do
  <<~RUBY.indent(2)
    # Config for mailcatcher
    config.action_mailer.default_url_options = { host: "localhost", port: 3000 }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = { address: "127.0.0.1", port: 1025 }
    config.action_mailer.raise_delivery_errors = false

    config.view_component.default_preview_layout = "preview"
  RUBY
end
