def source_paths
  [__dir__]
end

git :init
git add: "."
git commit: "-a -m 'Initial commit'"

features = %i[
  before_setup
  rubocop
  slim
  simple_form
  devise
  maintenance
  after_setup
]

features.each do |feature|
  say_status :info, "📦 Installing #{feature}..."
  apply "features/#{feature}.rb"
  git add: "."
  git commit: "-a -m 'Setup #{feature}'"
  say_status :info, "✅ #{feature} setup ok"
end
