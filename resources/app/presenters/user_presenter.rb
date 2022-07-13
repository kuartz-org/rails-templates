# frozen_string_literal: true

class UserPresenter < SimpleDelegator
  def created_at
    I18n.l(__getobj__.created_at, format: :short)
  end
end
