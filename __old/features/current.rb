inject_into_class "app/controllers/application_controller.rb",
  "ApplicationController",
  "  include SetCurrentRequestDetails\n"

active_menu_link = <<-RUBY

  private

  def active_menu_link
    root_path
  end
  helper_method :active_menu_link
RUBY

inject_into_file "app/controllers/application_controller.rb",
  active_menu_link,
  after: "before_action :authenticate_user!\n"

create_file "app/models/current.rb" do
<<-RUBY
# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttributes
  attribute :user

  def role
    user&.role.to_sym
  end
end

RUBY
end

create_file "app/models/concerns/set_current_request_details.rb" do
<<-RUBY
# frozen_string_literal: true

module SetCurrentRequestDetails
  extend ActiveSupport::Concern

  included do
    before_action do
      Current.user = current_user
    end

    after_action { Current.reset }
  end
end

RUBY
end
