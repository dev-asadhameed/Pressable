# frozen_string_literal: true

class SessionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def new
    redirect_to current_user if session[:user_id]
  end

  def create
    return unless user.authenticate(params[:password])

    session[:user_id] = user.id
    redirect_to user
  end

  def destroy
    session[:user_id] = nil

    redirect_to login_path, warning: I18n.t('warnings.sessions.destroy')
  end

  private

  def record_not_found
    redirect_to login_path, error: I18n.t('errors.sessions.find')
  end

  def user
    @user ||= User.find_by!(email: params[:email])
  end
end
