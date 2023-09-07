create_file "clevercloud/ruby.json", <<-YML
{
  "deploy": {
    "rakegoals": ["assets:precompile", "db:migrate"],
    "sidekiq": true
  }
}
YML

gsub_file "config/database.yml", /production:.*/m do |match|
<<-YML
production:
  <<: *default
  url: <%= ENV["POSTGRESQL_ADDON_URI"] %>
YML
end
