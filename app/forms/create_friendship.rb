# frozen_string_literal: true

class CreateFriendshipForm
  attr_reader :params, :friendship, :errors

  def initialize(friendship, params = {})
    @friendship = friendship
    @params = params
    @errors = []
  end

  def generate
    error_handler do
      ActiveRecord::Base.transaction do
        new_user = User.find_by(email: params[:email]) || User.create!(params)
        @friendship.friend_b_id = new_user.id

        @friendship.save!
      end
    end
  end

  private

  def error_handler
    yield if block_given?
  rescue StandardError => e
    @errors << e.message
  end
end
