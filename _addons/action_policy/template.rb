# frozen_string_literal: true

gem "action_policy"

template "_addons/action_policy/policies/admin/user_policy.rb.tt", "app/policies/admin/user_policy.rb", force: true

after_bundle do
  generate "action_policy:install"
end
