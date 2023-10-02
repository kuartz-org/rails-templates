# frozen_string_literal: true

after_bundle do
  run "importmap pin 'chart.js'"
  run "importmap pin 'date-fns'"
  run "importmap pin 'date-fns/locale/fr'"
  run "importmap pin 'chartjs-adapter-date-fns'"
end
