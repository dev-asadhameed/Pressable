# frozen_string_literal: true

# Presenter for User show template.
class UserPresenter
  attr_reader :user

  def initialize(user)
    @user = user

    freeze
  end

  def friendship_duration(friend)
    "
    #{day_format(user.friendship(friend).created_at)}
      #{time_format(user.friendship(friend).created_at)}
    "
  end

  def invited_by
    "You were invited by #{user.invited_by_user.first_name}."
  end

  private

  def time_format(time)
    time.strftime('%I:%M %p')
  end

  def day_format(time)
    time.strftime('%d %h %Y')
  end
end
