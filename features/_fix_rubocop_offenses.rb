run "rubocop -A --only 'Style/StringLiterals Style/ClassAndModuleChildren Style/FrozenStringLiteralComment'"
run "rubocop -A --only Layout/EmptyLineAfterMagicComment"
run "rubocop -A --only Layout/HashAlignment"
gsub_file "config/puma.rb", 'fetch("RAILS_MAX_THREADS") { 5 }', 'fetch("RAILS_MAX_THREADS", 5)'
gsub_file "config/puma.rb", 'fetch("PORT") { 3000 }', 'fetch("PORT", 3000)'
gsub_file "config/puma.rb", 'fetch("RAILS_ENV") { "development" }', 'fetch("RAILS_ENV", "development")'
gsub_file "config/puma.rb", 'fetch("PIDFILE") { "tmp/pids/server.pid" }', 'fetch("PIDFILE", "tmp/pids/server.pid")'
run "rubocop -A --only Style/StringLiterals"
