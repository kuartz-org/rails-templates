# frozen_string_literal: true

after_bundle do
  apply "config/importmap.rb"
  template "_addons/flatpickr/javascript/controllers/flatpickr_controller.js.tt", "app/javascript/controllers/flatpickr_controller.js"
  template "_addons/flatpickr/assets/stylesheets/flatpickr.css.tt", "app/assets/stylesheets/flatpickr.css"
  apply "_addons/flatpickr/assets/stylesheets/application.tailwind.css.rb"
end
