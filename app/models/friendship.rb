# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :friend_a, class_name: :User
  belongs_to :friend_b, class_name: :User

  validates :friend_a, :friend_b, presence: true
  validate :already_friends

  scope :for_id, lambda { |friend_a, friend_b|
                  where(
                    '(friend_a_id = ? AND friend_b_id = ?) OR (friend_a_id = ? AND friend_b_id = ?)',
                    friend_a, friend_b, friend_b, friend_a
                  )
                }

  private

  def already_friends
    friendship = Friendship.for_id(friend_a.id, friend_b.id)
    return if friendship.blank?

    errors.add(:base, "You are already friends with #{friend_b.email}")
  end
end
