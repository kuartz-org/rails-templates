# frozen_string_literal: true

append_to_file "config/importmap.rb" do
  <<~RUBY
    pin "flatpickr", to: "https://ga.jspm.io/npm:flatpickr@4.6.13/dist/esm/index.js"
    pin "flatpickr-french", to: "https://ga.jspm.io/npm:flatpickr@4.6.13/dist/l10n/fr.js"
  RUBY
end
