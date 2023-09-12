# frozen_string_literal: true

apply "config/importmap.rb"
template "javascript/controllers/flatpickr_controller.js", "app/javascript/controllers/flatpickr_controller.js"
template "assets/stylesheets/flatpickr.css.tt", "app/assets/stylesheets/flatpickr.css"
apply "assets/stylesheets/application.tailwind.css.rb"
