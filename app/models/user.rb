class User < ApplicationRecord
  has_secure_password

  ROLES = %w[friend].freeze

  # associations
  has_one :invited_by_user, ->(user) { unscope(:where).where('users.id = ?', user.invited_by_id) }, class_name: :User
  has_many :friendships, lambda { |user|
                           unscope(:where)
                             .where('friendships.friend_a_id = ? OR friendships.friend_b_id = ?',
                                    user.id, user.id)
                         }
  has_many :friends, lambda { |user|
                       unscope(:where)
                         .where(id: user.friendships.pluck(:friend_a_id, :friend_b_id).flatten.uniq -
                                Array.wrap(user.id))
                     }, class_name: :User

  # validations
  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, length: { in: 3..50 }
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validate :validate_roles

  def friendship(friend)
    # The pair is always unique.
    Friendship.for_id(id, friend.id).first
  end

  private

  def validate_roles
    return unless (roles - ROLES).any?

    errors.add(:roles, 'Roles not included in list')
  end
end
