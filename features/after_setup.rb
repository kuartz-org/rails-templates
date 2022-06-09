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
  apply "features/_clean_gemfile.rb"
  apply "features/_overmind.rb"
  apply "features/_fix_rubocop_offenses.rb"

  git :init
  git add: '.'
  git commit: "-a -m 'Complete setup from template'"

  say_status :info, "Setup complete 🚀"
end
