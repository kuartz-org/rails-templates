# frozen_string_literal: true

append_to_file "config/initializers/inflections.rb", <<~RUBY

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym "KPI"
end
RUBY
