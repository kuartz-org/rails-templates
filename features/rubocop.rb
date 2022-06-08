gem_group :development, :test do
  gem "rubocop-rails", require: false
end

copy_file "resources/.rubocop.yml", ".rubocop.yml"
