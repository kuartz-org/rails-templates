remove_file "app/assets/stylesheets/application.tailwind.css"
remove_file "app/javascript/controllers/sidebar_controller.js"
remove_file "app/views/devise/sessions/new.html.erb"
remove_file "app/views/devise/passwords/new.html.erb"
remove_file "app/views/layouts/application.html.erb"
remove_file "bin/dev"
remove_file "config/tailwind.config.js"
remove_file "config/routes.rb"
remove_file "Procfile.dev"
remove_file "README.md"

directory "resources/", "."

chmod "bin/dev", 0755
