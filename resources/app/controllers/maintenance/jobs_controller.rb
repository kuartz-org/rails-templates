# frozen_string_literal: true

module Maintenance
  class JobsController < BaseController
    def index
      @breadcrumb_items = {
        "maintenance.base.index.title": root_path
      }
    end
  end
end
