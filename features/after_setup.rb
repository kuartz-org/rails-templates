unused_gems = %i[
  bcrypt
  jbuilder
  kredis
  tzinfo-data
  sassc-rails
  image_processing
  debug
  rack-mini-profiler
  spring
]

unused_gems.each do |unused_gem|
  gsub_file "Gemfile", /^.*#{unused_gem}.*$/, ""
end

after_bundle do
  # Clean Gemfile
  gsub_file "Gemfile", /^#.*$\n\n/, "\n"
  gsub_file "Gemfile", /(^\n){2,}/, "\n"
  gsub_file "Gemfile", /^$\nend/, "end"
  gsub_file "Gemfile", /^.*do$\nend/, ""
  gsub_file "Gemfile", /end\n(^.+$)/ do |match|
    match.gsub(/end\n/, "end\n\n")
  end
  gsub_file "Gemfile", /(^\n){2,}/, "\n"

  # Fix offenses
  run "rubocop -A --only 'Style/StringLiterals Style/ClassAndModuleChildren Style/FrozenStringLiteralComment'"
  run "rubocop -A --only Layout/EmptyLineAfterMagicComment"
  gsub_file "config/puma.rb", 'fetch("RAILS_MAX_THREADS") { 5 }', 'fetch("RAILS_MAX_THREADS", 5)'
  gsub_file "config/puma.rb", 'fetch("PORT") { 3000 }', 'fetch("PORT", 3000)'
  gsub_file "config/puma.rb", 'fetch("RAILS_ENV") { "development" }', 'fetch("RAILS_ENV", "development")'
  gsub_file "config/puma.rb", 'fetch("PIDFILE") { "tmp/pids/server.pid" }', 'fetch("PIDFILE", "tmp/pids/server.pid")'
  run "rubocop -A --only Style/StringLiterals"

  git :init
  git add: '.'
  git commit: "-a -m 'Complete setup from template'"

  say_status :info, "Setup complete 🚀"
end
