gsub_file "Gemfile", /^#.*$\n\n/, "\n"
gsub_file "Gemfile", /(^\n){2,}/, "\n"
gsub_file "Gemfile", /^$\nend/, "end"
gsub_file "Gemfile", /^.*do$\nend/, ""
gsub_file "Gemfile", /end\n(^.+$)/ do |match|
  match.gsub(/end\n/, "end\n\n")
end
gsub_file "Gemfile", /(^\n){2,}/, "\n"
