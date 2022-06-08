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
  gsub_file "Gemfile", /end\n(^.+$)/ do |match|
    match.gsub(/end\n/, "end\n\n")
  end

  git :init
  git add: '.'
  git commit: "-a -m 'Complete setup from template'"
end
