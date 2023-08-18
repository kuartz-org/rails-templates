# frozen_string_literal: true

insert_into_file 'config/application.rb', before: /  end\nend\Z/ do
  <<~RUBY.indent(4)

    config.generators do |generate|
      generate.helper false
      generate.template_engine :slim
    end

    config.time_zone = "Europe/Paris"
    config.i18n.default_locale = :fr
    config.i18n.fallbacks = [:en]
    config.i18n.load_path += Dir[Rails.root.join("config/locales/**/*.{rb,yml}")]

    config.active_job.queue_adapter = :sidekiq
  RUBY
end
