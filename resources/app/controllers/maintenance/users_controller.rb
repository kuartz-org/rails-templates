# frozen_string_literal: true

module Maintenance
  class UsersController < BaseController
    def index
      @users = User.all
      @breadcrumb_items = {
        "maintenance.base.index.title": root_path
      }
    end

    def new
      @breadcrumb_items = {
        "maintenance.base.index.title": root_path,
        "maintenance.users.index.title": maintenance_users_path
      }
    end
  end
end
