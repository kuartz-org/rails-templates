gem "devise_invitable"

rails_command "generate devise_invitable:install"
rails_command "generate devise_invitable user"
rails_command "db:migrate"
