# frozen_string_literal: true

directory "_addons/modal/javascript/components", "app/javascript/components"
template "_addons/modal/javascript/controllers/modal_controller.js.tt", "app/javascript/controllers/modal_controller.js"
template "_addons/modal/helpers/modal_helper.rb.tt", "app/helpers/modal_helper.rb"
template "_addons/modal/views/layouts/_modal.html.slim.tt", "app/views/layouts/_modal.html.slim"
apply "_addons/modal/views/layouts/application.html.slim.rb"
