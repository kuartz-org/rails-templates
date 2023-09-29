# frozen_string_literal: true

after_bundle do
  run "importmap pin tom-select"
  template "_addons/tom_select/javascript/controllers/tom_select_controller.js.tt", "app/javascript/controllers/tom_select_controller.js"
  template "_addons/tom_select/assets/stylesheets/tom_select.css.tt", "app/assets/stylesheets/tom_select.css"
  apply "_addons/tom_select/assets/stylesheets/application.tailwind.css.rb"
end
