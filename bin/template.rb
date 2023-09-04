# frozen_string_literal: true

after_bundle do
  template "bin/dev.tt", force: true
end
