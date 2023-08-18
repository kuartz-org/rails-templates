credentials = <<-YML
fontawesome_url: https://kit.fontawesome.com/910f22a437.js
default_from_email: contact@example.com
YML

rails_command "credentials:edit"

file = ActiveSupport::EncryptedConfiguration.new(
  config_path: "config/credentials.yml.enc",
  key_path: "config/master.key",
  env_key: "RAILS_MASTER_KEY",
  raise_if_missing_key: true
)

file.write(credentials)
