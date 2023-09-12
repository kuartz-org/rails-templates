# frozen_string_literal: true

run "importmap pin tom-select"
template "javascript/controllers/tom_select_controller.js", "app/javascript/controllers/tom_select_controller.js"
template "assets/stylesheets/tom_select.css.tt", "app/assets/stylesheets/tom_select.css"
apply "assets/stylesheets/application.tailwind.css.rb"
