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
  run "importmap pin el-transition"

  apply "features/_presented_method.rb"
  apply "features/_copy_resources.rb"

  apply "features/_clean_gemfile.rb"
  apply "features/_fix_rubocop_offenses.rb"

  git :init
  git add: '.'
  git commit: "-a -m 'Complete setup from template'"

  apply "features/_credentials.rb"

  say_status :info, "Setup complete 🚀"
end

inject_into_file "config/environments/development.rb",
  'Rails.application.routes.default_url_options = { host: "localhost", port: 3000 }\n\n',
  before: "Rails.application.configure do"
