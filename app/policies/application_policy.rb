# frozen_string_literal: true

class ApplicationPolicy
  POLICY_ACTIONS = [].freeze
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  %i[index new show edit update create destroy].each do |action|
    define_method("#{action}?") do
      return unless self.class::POLICY_ACTIONS.include?(action)

      owner?
    end
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
