# frozen_string_literal: true

class FriendshipPolicy < ApplicationPolicy
  POLICY_ACTIONS = %i[show create destroy].freeze

  private

  def owner?
    (user == record.friend_a) || (user == record.friend_b)
  end
end
