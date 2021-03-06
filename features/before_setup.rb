run "gem install mailcatcher"

gem "rails-i18n", "~> 7.0.0"
gem "enumerize"

uncomment_lines "config/environments/production.rb", /config.force_ssl/

application_config = <<-RUBY
    config.generators do |generate|
      generate.helper false
      # Uncomment to use slim
      # generate.template_engine :slim
      # Uncomment to use rspec
      # generate.test_framework :rspec
    end

    config.time_zone = "Europe/Paris"
    config.i18n.default_locale = :fr
    config.i18n.fallbacks = [:en]
    config.i18n.load_path += Dir[Rails.root.join("config/locales/**/*.{rb,yml}")]

    config.active_job.queue_adapter = :sidekiq
RUBY

inject_into_file "config/application.rb",
  application_config,
  after: "# Configuration for the application, engines, and railties goes here.\n"

gem_group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
end
