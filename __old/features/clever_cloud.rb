clever_cloud_ruby_config = <<-YML
{
  "deploy": {
    "rakegoals": ["assets:precompile", "db:migrate"],
    "sidekiq": true
  }
}
YML

create_file "clevercloud/ruby.json", clever_cloud_ruby_config

gsub_file "config/database.yml", /production:.*/m do |match|
<<-YML
production:
  <<: *default
  url: <%= ENV["POSTGRESQL_ADDON_URI"] %>
YML
end
