# frozen_string_literal: true
class UserPolicy < ApplicationPolicy
  POLICY_ACTIONS = %i[show edit update].freeze

  private

  def owner?
    user == record
  end
end
