# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user, notice: 'フォローしました'
  end

  def destroy
    user = Follow.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user, notice: 'フォローを解除しました'
  end
end
