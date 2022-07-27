def source_paths
  [__dir__]
end

git :init
git add: "."
git commit: "-a -m 'Initial commit'"

features = %i[
  before_setup
  rubocop
  clever_cloud
  slim
  simple_form
  sidekiq
  devise
  devise_invitable
  maintenance
  view_component
  after_setup
]

features.each do |feature|
  say_status :info, "📦 Installing #{feature}..."
  apply "features/#{feature}.rb"
  git add: "."
  git commit: "-a -m 'Setup #{feature}'"
  say_status :info, "✅ #{feature} setup ok"
end
