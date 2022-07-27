# frozen_string_literal: true

class MenuLinkComponent < ViewComponent::Base
  attr_reader :title, :icon, :path, :active

  def initialize(title:, icon:, path:, active: false)
    @title = title
    @icon = icon
    @path = path
    @active = active
  end

  def active_classes
    active ? "bg-gray-500" : "hover:bg-gray-600 hover:bg-opacity-75"
  end
end
