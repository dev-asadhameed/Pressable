# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :authorized

  def create
    friendship = Friendship.new(friend_a_id: current_user.id)
    authorize friendship

    friendship_form = CreateFriendshipForm.new(friendship, permitted_params)
    friendship_form.generate

    if friendship_form.errors.blank?
      redirect_to current_user, success: I18n.t('success.friends.create')
    else
      redirect_to current_user, error: friendship_form.errors.to_sentence
    end
  end

  def destroy
    friendship = Friendship.find(params[:id])
    authorize friendship

    if friendship.destroy
      redirect_to current_user, warning: I18n.t('warnings.friends.destroy')
    else
      redirect_to current_user, error: friendship.errors
    end
  end

  private

  def permitted_params
    params.permit(:first_name, :last_name, :email, :password, roles: [])
  end
end
