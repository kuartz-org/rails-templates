# frozen_string_literal: true

run "importmap pin 'chart.js'"
run "importmap pin 'date-fns'"
run "importmap pin 'date-fns/locale'"
run "importmap pin 'chartjs-adapter-date-fns'"

template "javascript/controllers/chart_controller.js.tt", "app/javascript/controllers/chart_controller.js"
