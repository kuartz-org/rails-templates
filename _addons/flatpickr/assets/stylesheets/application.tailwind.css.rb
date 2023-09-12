# frozen_string_literal: true

append_to_file "app/assets/stylesheets/application.tailwind.css" do
  <<~CSS
    @import "flatpickr.css";
  CSS
end
