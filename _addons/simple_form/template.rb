# frozen_string_literal: true

gem "simple_form", "~> 5.2"

template "_addons/simple_form/config/initializers/simple_form_tailwind.rb", "config/initializers/simple_form_tailwind.rb"

after_bundle do
  rails_command "generate simple_form:install"
end
