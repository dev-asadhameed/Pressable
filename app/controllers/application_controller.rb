# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  add_flash_types :error, :warning, :success
  helper_method :logged_in?, :current_user

  def current_user
    return unless session[:user_id]

    User.find(session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def authorized
    redirect_to login_path unless logged_in?
  end
end
