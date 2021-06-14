# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :authorized, only: %i[show edit update]

  def create
    new_user = User.new(user_params)

    if new_user.save
      session[:user_id] = new_user.id
      redirect_to new_user
    else
      redirect_back fallback_location: root_path, error: new_user.errors.full_message
    end
  end

  def show
    @presenter = UserPresenter.new(user)
  end

  def edit; end

  def update
    authorize user

    if user.update(user_params)
      redirect_to user, success: I18n.t('success.users.update')
    else
      redirect_back fallback_location: '/', error: user.errors.full_message
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def user
    @user ||= authorize current_user
  end
end
