remove_file "app/views/devise/sessions/new.html.erb"
copy_file "resources/app/views/devise/sessions/new.html.slim", "app/views/devise/sessions/new.html.slim"

remove_file "resources/app/views/layouts/application.html.erb"
copy_file "resources/app/views/layouts/application.html.slim", "app/views/layouts/application.html.slim"
copy_file "resources/app/views/layouts/_head.html.slim", "app/views/layouts/_head.html.slim"
copy_file "resources/app/views/layouts/devise.html.slim", "app/views/layouts/devise.html.slim"

remove_file "bin/dev"
copy_file "resources/bin/dev", "bin/dev"
chmod "bin/dev", 0755

copy_file "resources/config/initializers/simple_form_tailwind_css.rb", "config/initializers/simple_form_tailwind_css.rb"

remove_file "config/tailwind.config.js"
copy_file "resources/config/tailwind.config.js", "config/tailwind.config.js"

remove_file "Procfile.dev"
copy_file "resources/Procfile.dev", "Procfile.dev"
