gem "sidekiq"
gem "sidekiq-failures", "~> 1.0"

gsub_file "config/environments/production.rb", /^.*config.active_job.queue_adapter.*$/,
  '  config.active_job.queue_adapter = :sidekiq'


sidekiq_initializer = <<-RUBY
# frozen_string_literal: true

if Rails.env.production?
  Sidekiq.configure_server do |config|
    config.redis = { url: ENV.fetch("REDIS_URL", nil), network_timeout: 5 }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: ENV.fetch("REDIS_URL", nil) }
  end
end
RUBY

create_file "config/initializers/sidekiq.rb", sidekiq_initializer

sidekiq_config = <<-YML
:concurrency: 3
:timeout: 60
:verbose: true
:queues:
  # Queue priority:
  # https://github.com/mperham/sidekiq/wiki/Advanced-Options
  # https://mikerogers.io/2019/06/06/rails-6-sidekiq-queues
  - default
  - mailers
  - active_storage_analysis
  - active_storage_purge
YML

create_file "config/sidekiq.yml", sidekiq_config

sidekiq_route = <<-RUBY
# frozen_string_literal: true

namespace :maintenance do
  require "sidekiq/web"
  authenticate :user, -> (user) { user.maintainer? } do
    mount Sidekiq::Web => "/sidekiq"
    resources :jobs, only: :index
  end
end
RUBY

create_file "config/routes/maintenance.rb", sidekiq_route

route "draw :maintenance"
